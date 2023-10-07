/// @param x
/// @param words
function __BigLShiftWord(_x, _words)
{
	var _i = BIG_MAX_WORDS - 1;
	repeat(1 + _i - _words)
	{
	    var _new = _x[_i - _words];
	    _x[@ _i] = _new;
	    --_i;
	}
    
	repeat(_words)
	{
	    _x[@ _i] = 0;
	    --_i;
	}
    
	return _x;
}