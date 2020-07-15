/// Big Integers
/// @jujuadams 2020-07-15
///
/// Based on:
/// https://github.com/kokke/tiny-bignum-c
/// https://github.com/ilia3101/Big-Integer-C

function big_number()
{
	return array_create(BIG_MAX_WORDS, int64(0));
}

#region Internal stuff

#macro __BIG_WORD_BITS 32
#macro __BIG_MAX_VALUE 0xffffffff
#macro __BIG_HALF_MAX  0x80000000

/// @param x
/// @param words
function __big_lshift_word(_x, _words)
{
	var _i = BIG_MAX_WORDS - 1;
	repeat(1 + _i - _words)
	{
	    var _new = _x[_i - _words];
	    _x[@ _i] = _new;
	    --_i;
	}
    
	repeat(_words)
	{
	    _x[@ _i] = 0;
	    --_i;
	}
    
	return _x;
}

/// @param x
/// @param words
function __big_rshift_word(_x, _words)
{
	if (_words >= BIG_MAX_WORDS)
	{
	    var _i = 0;
	    repeat(BIG_MAX_WORDS)
	    {
	        _x[@ _i] = 0;
	        ++_i;
	    }
        
	    return _x;
	}
    
	var _i = 0;
	repeat(BIG_MAX_WORDS - _words)
	{
	    _x[@ _i] = _x[_i + _words];
	    ++_i;
	}
    
	repeat(_words)
	{
	    _x[@ _i] = 0;
	    ++_i;
	}
    
	return _x;
}

/// @param x
function __big_lshift_bit(_x)
{
	var _i = BIG_MAX_WORDS - 1;
	repeat(_i)
	{
	    _x[@ _i] = ((_x[_i] << 1) | (_x[_i - 1] >> 31)) & __BIG_MAX_VALUE;
	    --_i;
	}
    
	_x[@ 0] = (_x[0] << 1) & __BIG_MAX_VALUE;
    
	return _x;
}

/// @param x
function __big_rshift_bit(_x)
{
	var _i = 0;
	repeat(BIG_MAX_WORDS - 1)
	{
	    _x[@ _i] = ((_x[_i] >> 1) | (_x[_i + 1] << 31)) & __BIG_MAX_VALUE;
	    ++_i;
	}
    
	_x[@ BIG_MAX_WORDS - 1] = _x[BIG_MAX_WORDS - 1] >> 1;
    
	return _x;
}

/// @param x
/// @param limit
function __big_limit_words(_x, _limit)
{
	var _i = _limit;
	repeat(BIG_MAX_WORDS - _limit)
	{
	    _x[@ _i] = 0;
	    ++_i;
	}
    
	return _x;
}

#endregion