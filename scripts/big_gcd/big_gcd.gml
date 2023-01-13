/// @param a
/// @param b

function big_gcd(_a, _b)
{
	while(true)
	{
	    var _temp = big_mod(_a, _b, big_zero());
	    if (big_is_zero(_temp)) return _b;
	    _a = _b;
	    _b = _temp;
	}
}