/// Adds two BIG numbers and returns the result
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

function BigAdd(_a, _b, _writeTo = undefined)
{
    __BIG_HANDLE_RESULT_PRE
    
	var _temp = 0;
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    _temp = _a[_i] + _b[_i] + (_temp > __BIG_MAX_VALUE);
	    _out[@ _i++] = _temp & __BIG_MAX_VALUE;
	}
    
	return _out;
}