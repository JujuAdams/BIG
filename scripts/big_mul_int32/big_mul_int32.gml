/// @param x
/// @param int32

function big_mul_int32(_x, _int)
{
	var _y = big_number();
    
	var _i = 0;
	repeat(BIG_MAX_WORDS)
	{
	    var _temp = big_from_int(_x[_i] * _int);
	    __big_lshift_word(_temp, _i);
	    big_add(_y, _temp, _y);
        
	    ++_i;
	}
    
	return _y;
}