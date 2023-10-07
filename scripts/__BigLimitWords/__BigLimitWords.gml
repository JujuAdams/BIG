/// @param x
/// @param limit
function __BigLimitWords(_x, _limit)
{
	var _i = _limit;
	repeat(BIG_MAX_WORDS - _limit)
	{
	    _x[@ _i] = 0;
	    ++_i;
	}
    
	return _x;
}