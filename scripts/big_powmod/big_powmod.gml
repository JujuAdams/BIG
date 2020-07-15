/// @param x
/// @param modulus
/// @param exponent
/// @param debugIterations

function big_powmod(_x, _modulus, _exponent, _debug)
{
	_x        = big_duplicate(_x);
	_exponent = big_duplicate(_exponent);
    
	var _result = big_from_int(1);
    
	big_mod(_x, _modulus, _x);
    
	if (!_debug)
	{
	    while(!big_is_zero(_exponent))
	    {
	        if (_exponent[0] & 1) big_mod(big_mul(_x, _result), _modulus, _result);
	        __big_rshift_bit(_exponent);
	        big_mod(big_sqr(_x), _modulus, _x);
	    }
	}
	else
	{
	    var _i = 0;
	    while(!big_is_zero(_exponent))
	    {
	        if (_exponent[0] & 1) big_mod(big_mul(_x, _result), _modulus, _result);
	        __big_rshift_bit(_exponent);
	        big_mod(big_sqr(_x), _modulus, _x);
	        show_debug_message(_i++);
	    }
	}
    
	return _result;
}