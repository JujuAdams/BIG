//// @param x

function big_to_int(_x)
{
	return ((_x[1] << __BIG_WORD_BITS) | _x[0]);
}