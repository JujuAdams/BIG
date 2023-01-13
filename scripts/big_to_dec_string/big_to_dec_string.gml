/// @param x

function big_to_dec_string(_x)
{
	var _string = "";
	var _ten = big_from_int(10);
    
	do
	{
	    var _next = big_div(_x, _ten);
        var _b = big_mul(_next, _ten);
	    var _digit = big_sub(_x, _b, big_zero());
	    _string = string(_digit[0]) + _string;
	    _x = _next;
	}
	until big_is_zero(_x);
    
	return _string;
}