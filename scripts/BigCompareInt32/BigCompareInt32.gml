/// @param x
/// @param int32

function BigCompareInt32(_x, _int)
{
	if (_x[0] > _int) return BIG.GREATER;
    
	var _i = 1;
	repeat(BIG_MAX_WORDS - 1)
	{
	    if _x[_i] return BIG.GREATER;
	    ++_i;
	}
    
	if (_x[0] < _int) return BIG.LESSER;
	return BIG.EQUAL;
}