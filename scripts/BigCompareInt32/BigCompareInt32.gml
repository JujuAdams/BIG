/// Comapares a BIG number to a simple integer and returns the result
/// 
/// This function will return one of the following:
///   BIG.GREATER = the BIG number is greater than the simple integer
///   BIG.EQUAL   = the BIG number is equal to the simple integer
///   BIG.LESSER  = the BIG number is lesser than the simple integer
/// 
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