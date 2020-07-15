/// @param string

function big_from_utf8(_string)
{
	var _buffer = buffer_create(string_byte_length(_string), buffer_fixed, 1);
	buffer_write(_buffer, buffer_text, _string);
	var _x = big_from_buffer(_buffer, false);
	buffer_delete(_buffer);
	return _x;
}