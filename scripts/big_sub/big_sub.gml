/// @param a
/// @param b
/// @param out

function big_sub(_a, _b, _out)
{
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