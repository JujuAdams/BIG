/// Generates a BIG number equal to zero

function BigZero()
{
	return array_create(BIG_MAX_WORDS, int64(0));
}