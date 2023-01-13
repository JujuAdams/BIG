/// @param a
/// @param b
/// @param [writeTo]

function big_mod(_a, _b, _writeTo)
{
    __BIG_HANDLE_OUT
    
	_b = big_duplicate(_b);
	var _exp = 1;
    
	var _a_words = big_word_count(_a);
	var _b_words = big_word_count(_b);
    
	//Shift words in bulk if A and B are very different
	if (_b_words < _a_words)
	{
	    __big_lshift_word(_b, _a_words - _b_words);
	    _exp += __BIG_WORD_BITS*(_a_words - _b_words);
	}
    
	while(big_compare(_b, _a) != BIG.GREATER) //Repeat until B is larger than A
	{
	    if (_b[BIG_MAX_WORDS - 1] >= __BIG_HALF_MAX) //If B overflows (most significant bit is 1) then break out of this loop
	    {
	        __big_rshift_bit(_b); //B = B >> 1
	        --_exp;
	        break;
	    }
        
	    __big_lshift_bit(_b); //B = B << 1
	    ++_exp;
	}
    
	//Don't bother copying from A to Out if they're the same array
	if (_a != _out) array_copy(_out, 0, _a, 0, BIG_MAX_WORDS); 
    
	repeat(_exp)
	{
	    if (big_compare(_out, _b) != BIG.LESSER) //If A is greater than or equal to B
	    {
	        big_sub(_out, _b, _out); //A = A - B
	    }
        
	    __big_rshift_bit(_b); //B = B >> 1
	}
    
	return _out;
}