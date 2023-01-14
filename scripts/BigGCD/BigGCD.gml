/// @param a
/// @param b

function BigGCD(_a, _b)
{
	while(true)
	{
	    var _temp = BigMod(_a, _b);
	    if (BigIsZero(_temp)) return _b;
	    _a = _b;
	    _b = _temp;
	}
}