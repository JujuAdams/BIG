/// Increments the value of x by 1
/// This directly modifies x and can be used without the return e.g.
///    x = big_from_int(3);
///    big_inc(x);
///    show_debug_message(x); //x is now 4
///
/// @param x

function big_inc(_x)
{
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    var _temp = _x[_i];
	    var _res = _temp + 1;
	    _x[@ _i] = _res;
        
	    if (_res > _temp) break;
        
	    ++_i;
	}
    
	return _x;
}