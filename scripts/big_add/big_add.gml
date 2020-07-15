/// @param a
/// @param b
/// @param out

function big_add(_a, _b, _out)
{
	var _temp = 0;
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    _temp = _a[_i] + _b[_i] + (_temp > __BIG_MAX_VALUE);
	    _out[@ _i++] = _temp & __BIG_MAX_VALUE;
	}
    
	return _out;
}