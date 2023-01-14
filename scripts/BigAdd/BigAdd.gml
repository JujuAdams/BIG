/// @param a
/// @param b
/// @param [writeTo]

function BigAdd(_a, _b, _writeTo)
{
    __BIG_HANDLE_OUT
    
	var _temp = 0;
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    _temp = _a[_i] + _b[_i] + (_temp > __BIG_MAX_VALUE);
	    _out[@ _i++] = _temp & __BIG_MAX_VALUE;
	}
    
	return _out;
}