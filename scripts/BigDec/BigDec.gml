/// Decrements the value of a BIG number by 1
/// 
/// This directly modifies the input and can be used without the return e.g.
///    x = BigFromInteger(3);
///    BigDec(x);
///    show_debug_message(x); //x is now 2
///
/// @param x

function BigDec(_x)
{
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    var _temp = _x[_i];
	    var _res = _temp - 1;
	    _x[@ _i] = _res;
        
	    if (_res <= _temp) break;
        
	    ++_i;
	}
    
	return _x;
}