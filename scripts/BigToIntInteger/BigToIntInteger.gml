/// Converts a BIG number to an integer
/// 
/// @param x

function BigToIntInteger(_x)
{
	return ((_x[1] << __BIG_WORD_BITS) | _x[0]);
}