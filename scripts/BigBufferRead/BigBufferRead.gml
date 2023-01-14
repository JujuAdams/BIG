/// @param buffer
/// @param [bigEndian=true]  Most significant byte comes first

function BigBufferRead(_buffer, _bigEndian = true)
{
	var _old_tell = buffer_tell(_buffer);
	buffer_seek(_buffer, buffer_seek_start, 0);
    
	if (_bigEndian)
	{
	    var _x = BigZero();
	    _x = BigAddInt32(_x, buffer_read(_buffer, buffer_u8));
        
	    repeat(buffer_get_size(_buffer) - 1)
	    {
	        _x = BigMulInt32(_x, 256);
	        _x = BigAddInt32(_x, buffer_read(_buffer, buffer_u8));
	    }
	}
	else
	{
	    var _i = buffer_get_size(_buffer) - 1;
        
	    var _x = BigZero();
	    _x = BigAddInt32(_x, buffer_peek(_buffer, _i, buffer_u8));
	    --_i;
        
	    repeat(buffer_get_size(_buffer) - 1)
	    {
	        _x = BigMulInt32(_x, 256);
	        _x = BigAddInt32(_x, buffer_peek(_buffer, _i, buffer_u8));
	        --_i;
	    }
	}
    
	buffer_seek(_buffer, buffer_seek_start, _old_tell);
    
	return _x;
}