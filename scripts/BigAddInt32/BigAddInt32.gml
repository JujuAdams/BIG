/// @param x
/// @param int32

function BigAddInt32(_x, _int)
{
	var _y = BigZero();
    
	var _temp = _x[0] + _int;
	var _carry = (_temp > __BIG_MAX_VALUE);
	_y[@ 0] = _temp & __BIG_MAX_VALUE;
    
	var _i = 1;
	repeat(BIG_MAX_WORDS - 1)
	{
	    var _temp = _x[_i] + _carry;
	    _carry = (_temp > __BIG_MAX_VALUE);
	    _y[@ _i] = _temp & __BIG_MAX_VALUE;
        
	    ++_i;
	}
    
	return _y;
}