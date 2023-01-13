/// @param x
/// @param modulo

function big_invmod(_a, _modulo)
{
	var _i = is_array(_modulo)? _modulo : big_from_int(_modulo);
	var _v = big_zero();
	var _d = big_from_int(1);
    
	while(!big_is_zero(_a))
	{
	    var _t = big_div(_i, _a);
	    var _x = _a;
	        _a = big_mod(_i, _x);
	    var _i = _x;
	        _x = _d;
	        _d = big_sub(_v, big_mul(_t, _x));
	        _v = _x;
	}
    
	if (big_is_negative(_v)) return big_mod(big_add(_v, _modulo), _modulo);
	return big_mod(_v, _modulo);
}