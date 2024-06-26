/// Returns the inverse modulo of a BIG number and returns the result
/// 
/// @param x
/// @param modulo

function BigInvMod(_a, _modulo)
{
    //TODO - Optimsise
    
	var _i = is_array(_modulo)? _modulo : BigFromInteger(_modulo);
	var _v = BigZero();
	var _d = BigFromInteger(1);
    
	while(!BigIsZero(_a))
	{
	    var _t = BigDiv(_i, _a);
	    var _x = _a;
	        _a = BigMod(_i, _x);
	    var _i = _x;
	        _x = _d;
	        _d = BigSub(_v, BigMul(_t, _x));
	        _v = _x;
	}
    
	if (BigIsNegative(_v)) return BigMod(BigAdd(_v, _modulo), _modulo);
	return BigMod(_v, _modulo);
}