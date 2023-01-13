/// @param buffer
/// @param x
/// @param [bigEndian=true]  Most significant byte comes first

function big_buffer_write(_buffer, _x, _big_endian = true)
{
    if (_big_endian)
    {
    	var _i = 0;
    	repeat(BIG_MAX_WORDS)
    	{
    	    buffer_write(_buffer, buffer_u32, _x[_i]);
    	    ++_i;
    	}
    }
    else
    {
    	var _i = BIG_MAX_WORDS-1;
    	repeat(BIG_MAX_WORDS)
    	{
    	    buffer_write(_buffer, buffer_u32, _x[_i]);
    	    --_i;
    	}
    }
}