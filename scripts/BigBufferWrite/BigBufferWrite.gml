/// @param buffer
/// @param x
/// @param [bigEndian=true]  Most significant byte comes first

function BigBufferWrite(_buffer, _x, _bigEndian = true)
{
    if (_bigEndian)
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