/// @param x

function big_to_utf8(_x)
{
	var _buffer = big_to_buffer(_x);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	return _string;
}