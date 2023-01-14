/// @param a
/// @param b
/// @param [writeTo]

function BigMod(_a, _b, _writeTo)
{
    __BIG_HANDLE_OUT
    
	_b = BigDuplicate(_b);
	var _exp = 1;
    
	var _a_words = BigWordCount(_a);
	var _b_words = BigWordCount(_b);
    
	//Shift words in bulk if A and B are very different
	if (_b_words < _a_words)
	{
	    __BigLShiftWord(_b, _a_words - _b_words);
	    _exp += __BIG_WORD_BITS*(_a_words - _b_words);
	}
    
	while(BigCompare(_b, _a) != BIG.GREATER) //Repeat until B is larger than A
	{
	    if (_b[BIG_MAX_WORDS - 1] >= __BIG_HALF_MAX) //If B overflows (most significant bit is 1) then break out of this loop
	    {
	        __BigRShiftBit(_b); //B = B >> 1
	        --_exp;
	        break;
	    }
        
	    __BigLShiftBit(_b); //B = B << 1
	    ++_exp;
	}
    
	//Don't bother copying from A to Out if they're the same array
	if (_a != _out) array_copy(_out, 0, _a, 0, BIG_MAX_WORDS); 
    
	repeat(_exp)
	{
	    if (BigCompare(_out, _b) != BIG.LESSER) //If A is greater than or equal to B
	    {
	        BigSub(_out, _b, _out); //A = A - B
	    }
        
	    __BigRShiftBit(_b); //B = B >> 1
	}
    
	return _out;
}