function big_zero()
{
	return array_create(BIG_MAX_WORDS, int64(0));
}

/// Big Integers
///
/// Based on:
/// https://github.com/kokke/tiny-bignum-c
/// https://github.com/ilia3101/Big-Integer-C

#region Internal stuff

#macro __BIG_VERSION "0.2.0"
#macro __BIG_DATE "2023-01-13"
show_debug_message("BIG: Welcome to BIG Integers by @jujuadams! This is version " + __BIG_VERSION + ", " + __BIG_DATE);

#macro __BIG_WORD_BITS 32
#macro __BIG_MAX_VALUE 0xffffffff
#macro __BIG_HALF_MAX  0x80000000

#macro __BIG_HANDLE_OUT if (_writeTo == 0)\
                        {\
                            var _out = _a;\
                        }\
                        else if (_writeTo == 1)\
                        {\
                            var _out = _b;\
                        }\
                        else if (_writeTo == undefined)\
                        {\
                            var _out = big_zero();\
                        }\
                        else if (is_array(_writeTo))\
                        {\
                            var _out = _writeTo;\
                        }\
                        else\
                        {\
                            show_error("BIG:\n[writeTo] argument must be 0, 1, or <undefined>\n ", true);\
                        }

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