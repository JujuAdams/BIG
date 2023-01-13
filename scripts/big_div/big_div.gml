/// @param a
/// @param b

function big_div(_a, _b)
{
	_b = big_duplicate(_b);
    var _e = 0;
    
    var _overflow = false;
	while(big_compare(_b, _a) != BIG.GREATER) //Repeat until B is larger than A
	{
	    if (_b[BIG_MAX_WORDS - 1] >= __BIG_HALF_MAX) //If B overflows (most significant bit is 1) then break out of this loop
	    {
	        _overflow = true;
	        break;
	    }
        
	    __big_lshift_bit(_b); //B = B << 1
        _e++;
	}
    
    if (!_overflow)
    {
	    __big_rshift_bit(_b); //B = B >> 1
        _e--;
    }
    
	_a = big_duplicate(_a);
	var _out = array_create(BIG_MAX_WORDS, 0);
	repeat(_e+1)
	{
	    if (big_compare(_a, _b) != BIG.LESSER) //If A is greater than or equal to B
	    {
	        big_sub(_a, _b, 0); //A = A - B
	        _out[@ _e div __BIG_WORD_BITS] |= (1 << (_e mod __BIG_WORD_BITS));
	    }
        
	    __big_rshift_bit(_b); //B = B >> 1
        _e--;
	}
    
	return _out;
}