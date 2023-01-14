//// @param x

function BigToInt(_x)
{
	return ((_x[1] << __BIG_WORD_BITS) | _x[0]);
}