/// @param a
/// @param b

function BigGCD(_a, _b)
{
    static _bWork = BigZero();
    BigCopyTo(_b, _bWork);
    
	while(true)
	{
	    var _temp = BigMod(_a, _bWork);
	    if (BigIsZero(_temp)) return _bWork;
	    _a = _bWork;
	    _bWork = _temp;
	}
}