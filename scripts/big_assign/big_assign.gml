/// Copies the contents of x into y
///
/// @param x
/// @param y

function big_assign(_x, _y)
{
	array_copy(_y, 0, _x, 0, BIG_MAX_WORDS);
	return _y;
}