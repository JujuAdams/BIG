/// Subtracts "b" from "a", with both being BIG numbers, and returns the result
/// 
/// How this function returns is determined by the "writeTo" argument:
///   writeTo = undefined:     A new BIG container is generated and returned
///   writeTo = 0:             BIG number "a" is used to hold the resulting value, and "a" is returned by the function
///   writeTo = 1:             BIG number "b" is used to hold the resulting value, and "b" is returned by the function
///   writeTo = <BIG number>:  The result overwrites the target BIG number
/// 
/// @param a
/// @param b
/// @param [writeTo]

function BigSub(_a, _b, _writeTo = undefined)
{
    __BIG_HANDLE_RESULT_PRE
    
	var _borrow = 0;
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    var _temp1 = _a[_i] + __BIG_MAX_VALUE + 1;
	    var _temp2 = _b[_i] + _borrow;
	    var _res = _temp1 - _temp2;
        
	    _out[@ _i] = _res & __BIG_MAX_VALUE;
	    _borrow = (_res <= __BIG_MAX_VALUE);
        
	    ++_i;
	}
    
	return _out;
}