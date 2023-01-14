/// @param x
/// @param int32

function BigMulInt32(_x, _int)
{
	var _y = BigZero();
    
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    var _temp = BigFromInt(_x[_i] * _int);
	    __BigLShiftWord(_temp, _i);
	    BigAdd(_y, _temp, 0);
        
	    ++_i;
	}
    
	return _y;
}