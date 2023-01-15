/// @param a
/// @param b
/// @param [writeTo]

function BigDiv(_a, _b, _writeTo = undefined)
{
    __BIG_HANDLE_RESULT_PRE
    
	_a = BigDuplicate(_a);
	_b = BigDuplicate(_b);
    
    var _e = 0;
    var _overflow = false;
	while(BigCompare(_b, _a) != BIG.GREATER) //Repeat until B is larger than A
	{
	    if (_b[BIG_MAX_WORDS - 1] >= __BIG_HALF_MAX) //If B overflows (most significant bit is 1) then break out of this loop
	    {
	        _overflow = true;
	        break;
	    }
        
	    __BigLShiftBit(_b); //B = B << 1
        _e++;
	}
    
    if (!_overflow)
    {
	    __BigRShiftBit(_b); //B = B >> 1
        _e--;
    }
    
	repeat(_e+1)
	{
	    if (BigCompare(_a, _b) != BIG.LESSER) //If A is greater than or equal to B
	    {
	        BigSub(_a, _b, 0); //A = A - B
	        _out[@ _e div __BIG_WORD_BITS] |= (1 << (_e mod __BIG_WORD_BITS));
	    }
        
	    __BigRShiftBit(_b); //B = B >> 1
        _e--;
	}
    
	return _out;
}