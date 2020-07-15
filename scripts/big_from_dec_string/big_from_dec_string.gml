/// @param string

function big_from_dec_string(_string)
{
	var _x = big_number();
	if (_string == "") return _x;
    
	_x = big_add_int32(_x, real(string_char_at(_string, 1)));
    
	var _i = 2;
	repeat(string_length(_string) - 1)
	{
	    _x = big_mul_int32(_x, 10);
	    _x = big_add_int32(_x, real(string_char_at(_string, _i)));
	    ++_i;
	}
    
	return _x;
}