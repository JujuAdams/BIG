/// Subtracts a 32-bit integer from a BIG number and returns the result
/// 
/// How this function returns is determined by the "writeTo" argument:
///   writeTo = undefined:     A new BIG container is generated and returned
///   writeTo = 0:             BIG number "x" is used to hold the resulting value, and "x" is returned by the function
///   writeTo = <BIG number>:  The result overwrites the target BIG number
/// 
/// @param x
/// @param int32
/// @param [writeTo]

function BigSubInt32(_x, _int, _writeTo = undefined)
{
    __BIG_HANDLE_RESULT_PRE_MONO
    
	var _res = _x[0] + __BIG_MAX_VALUE + 1 - _int;
	_out[@ 0] = _res & __BIG_MAX_VALUE;
	var _borrow = (_res <= __BIG_MAX_VALUE);
    
	var _i = 1;
	repeat(BIG_MAX_WORDS - 1)
	{
	    var _res = _x[_i] + __BIG_MAX_VALUE + 1 - _borrow;
        
	    _out[@ _i] = _res & __BIG_MAX_VALUE;
	    _borrow = (_res <= __BIG_MAX_VALUE);
        
	    ++_i;
	}
    
	return _out;
}