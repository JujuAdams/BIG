/// @param x
/// @param words
function __BigRShiftWord(_x, _words)
{
	if (_words >= BIG_MAX_WORDS)
	{
	    var _i = 0;
	    repeat(BIG_MAX_WORDS)
	    {
	        _x[@ _i] = 0;
	        ++_i;
	    }
        
	    return _x;
	}
    
	var _i = 0;
	repeat(BIG_MAX_WORDS - _words)
	{
	    _x[@ _i] = _x[_i + _words];
	    ++_i;
	}
    
	repeat(_words)
	{
	    _x[@ _i] = 0;
	    ++_i;
	}
    
	return _x;
}