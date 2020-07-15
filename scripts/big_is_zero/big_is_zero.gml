/// @param x

function big_is_zero(_x)
{
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    if _x[_i] return false;
	    ++_i;
	}
    
	return true;
}