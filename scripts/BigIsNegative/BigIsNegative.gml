/// Returns if a BIG number is negative
/// 
/// @param x

function BigIsNegative(_x)
{
	return (_x[BIG_MAX_WORDS-1] & 0x80000000);
}