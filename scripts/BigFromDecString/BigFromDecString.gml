/// @param string

function BigFromDecString(_string)
{
	var _x = BigZero();
	if (_string == "") return _x;
    
	_x = BigAddInt32(_x, real(string_char_at(_string, 1)));
    
	var _i = 2;
	repeat(string_length(_string) - 1)
	{
	    _x = BigMulInt32(_x, 10);
	    _x = BigAddInt32(_x, real(string_char_at(_string, _i)));
	    ++_i;
	}
    
	return _x;
}