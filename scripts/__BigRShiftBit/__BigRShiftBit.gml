/// @param x
function __BigRShiftBit(_x)
{
	var _i = 0;
	repeat(BIG_MAX_WORDS - 1)
	{
	    _x[@ _i] = ((_x[_i] >> 1) | (_x[_i + 1] << 31)) & __BIG_MAX_VALUE;
	    ++_i;
	}
    
	_x[@ BIG_MAX_WORDS - 1] = _x[BIG_MAX_WORDS - 1] >> 1;
    
	return _x;
}