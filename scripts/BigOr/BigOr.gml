/// @param a
/// @param b
/// @param [writeTo]

function BigOr(_a, _b, _writeTo)
{
    __BIG_HANDLE_OUT
    
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    _out[@ _i] = _a[_i] | _b[_i];
	    ++_i;
	}
    
	return _out;
}