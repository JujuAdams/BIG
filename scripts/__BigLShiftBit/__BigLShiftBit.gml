/// @param x
function __BigLShiftBit(_x)
{
	var _i = BIG_MAX_WORDS - 1;
	repeat(_i)
	{
	    _x[@ _i] = ((_x[_i] << 1) | (_x[_i - 1] >> 31)) & __BIG_MAX_VALUE;
	    --_i;
	}
    
	_x[@ 0] = (_x[0] << 1) & __BIG_MAX_VALUE;
    
	return _x;
}