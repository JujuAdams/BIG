/// @param x

function big_duplicate(_x)
{
	var _y = big_number();
	array_copy(_y, 0, _x, 0, BIG_MAX_WORDS);
	return _y;
}