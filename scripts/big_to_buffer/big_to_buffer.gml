/// @param x

function big_to_buffer(_x)
{
	var _buffer = buffer_create(4*BIG_MAX_WORDS, buffer_fixed, 1);
    
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    buffer_write(_buffer, buffer_u32, _x[_i]);
	    ++_i;
	}
    
	buffer_seek(_buffer, buffer_seek_start, 0);
    
	return _buffer;
}