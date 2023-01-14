/// @param x

function BigIsNegative(_x)
{
	return (_x[BIG_MAX_WORDS-1] & 0x80000000);
}