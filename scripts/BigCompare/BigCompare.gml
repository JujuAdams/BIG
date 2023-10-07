/// Comapares two BIG numbers and returns the result
/// 
/// This function will return one of the following:
///   BIG.GREATER = "a" is greater than "b"
///   BIG.EQUAL   = "a" is equal to b"
///   BIG.LESSER  = "a" is lesser than b"
///
/// @param a
/// @param b

enum BIG
{
	GREATER,
	LESSER,
	EQUAL,
}

function BigCompare(_a, _b)
{
	var _i = BIG_MAX_WORDS - 1;
	repeat(BIG_MAX_WORDS)
	{
	    var _a_val = _a[_i];
	    var _b_val = _b[_i];
        
	    if (_a_val > _b_val) return BIG.GREATER;
	    if (_a_val < _b_val) return BIG.LESSER;
    
	    --_i;
	}
    
	return BIG.EQUAL;
}