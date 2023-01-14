//// @param x
function BigFromInt(_x)
{
	var _y = BigZero();
	_y[@ 0] = _x & __BIG_MAX_VALUE;
	_y[@ 1] = (_x >> __BIG_WORD_BITS) & __BIG_MAX_VALUE; //AND operation stops negative values leaking through
	return _y;
}