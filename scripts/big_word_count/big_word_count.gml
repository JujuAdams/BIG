/// @param x

function big_word_count(_x)
{
	var _i = BIG_MAX_WORDS;
	repeat(BIG_MAX_WORDS)
	{
	    if (_x[_i - 1]) break;
	    --_i;
	}
    
	return _i;
}