/// @param x
/// @param modulus
/// @param exponent
/// @param [debug=false]

function BigPowMod(_x, _modulus, _exponent, _debug = false)
{
	_x        = BigDuplicate(_x);
	_exponent = BigDuplicate(_exponent);
    
	var _result = BigFromInt(1);
    
	BigMod(_x, _modulus, 0);
    
	if (!_debug)
	{
	    while(!BigIsZero(_exponent))
	    {
	        if (_exponent[0] & 1) BigMod(BigMul(_x, _result), _modulus, _result);
	        __BigRShiftBit(_exponent);
	        BigMod(BigSqr(_x), _modulus, _x);
	    }
	}
	else
	{
	    var _i = 0;
	    while(!BigIsZero(_exponent))
	    {
	        if (_exponent[0] & 1) BigMod(BigMul(_x, _result), _modulus, _result);
	        __BigRShiftBit(_exponent);
	        BigMod(BigSqr(_x), _modulus, _x);
	        show_debug_message(_i++);
	    }
	}
    
	return _result;
}