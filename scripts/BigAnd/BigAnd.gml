/// Performs a bitwise AND operation between two BIG numbers and returns the result
/// 
/// @param a
/// @param b
/// @param [writeTo]

function BigAnd(_a, _b, _writeTo)
{
    __BIG_HANDLE_RESULT_PRE
    
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    _out[@ _i] = _a[_i] & _b[_i];
	    ++_i;
	}
    
	return _out;
}