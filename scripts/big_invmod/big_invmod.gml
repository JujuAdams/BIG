/// @param x
/// @param modulo

function big_invmod()
{
    var _a = argument0;
    var _n = argument1;
    
	var _i = _n;
	var _v = big_from_int(0);
	var _d = big_from_int(1);
    
	while(!big_is_zero(_a))
	{
	    var _t = big_div(_i, _a);
	    var _x = _a;
	    var _a = big_mod(_i, _x, big_zero());
	    var _i = _x;
	    var _x = _d;
	    var _d = big_sub(_v, big_mul(_t, _x), big_zero());
	    var _v = _x;
	}
    
	if (big_is_negative(_v)) return big_mod(big_add(_v, _n, big_zero()), _n, big_zero());
	return big_mod(_v, _n, big_zero());
}