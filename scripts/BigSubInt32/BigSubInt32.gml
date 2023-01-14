/// @param x
/// @param int32

function BigSubInt32(_x, _int)
{
	var _y = BigZero();
    
	var _res = _x[0] + __BIG_MAX_VALUE + 1 - _int;
	_y[@ 0] = _res & __BIG_MAX_VALUE;
	var _borrow = (_res <= __BIG_MAX_VALUE);
    
	var _i = 1;
	repeat(BIG_MAX_WORDS - 1)
	{
	    var _res = _x[_i] + __BIG_MAX_VALUE + 1 - _borrow;
        
	    _y[@ _i] = _res & __BIG_MAX_VALUE;
	    _borrow = (_res <= __BIG_MAX_VALUE);
        
	    ++_i;
	}
    
	return _y;
}