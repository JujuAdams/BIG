/// @param a
/// @param b
/// @param out

function big_or(_a, _b, _out)
{
	var _c = big_number();
    
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    _out[@ _i] = _a[_i] | _b[_i];
	    ++_i;
	}
    
	return _c;
}