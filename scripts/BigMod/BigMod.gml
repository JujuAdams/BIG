/// Modulos "a" by "b", both BIG numbers, and returns the result
/// 
/// How this function returns is determined by the "writeTo" argument:
///   writeTo = undefined:     A new BIG container is generated and returned
///   writeTo = 0:             BIG number "a" is used to hold the resulting value, and "a" is returned by the function
///   writeTo = 1:             BIG number "b" is used to hold the resulting value, and "b" is returned by the function
///   writeTo = <BIG number>:  The result overwrites the target BIG number
/// 
/// @param a
/// @param b
/// @param [writeTo]

function BigMod(_a, _b, _writeTo = undefined)
{
    __BIG_HANDLE_RESULT_PRE
    
    static _bWork = BigZero();
	_bWork = BigCopyTo(_b, _bWork);
    
	var _exp = 1;
    
	var _a_words = BigWordCount(_a);
	var _b_words = BigWordCount(_bWork);
    
	//Shift words in bulk if A and B are very different
	if (_b_words < _a_words)
	{
	    __BigLShiftWord(_bWork, _a_words - _b_words);
	    _exp += __BIG_WORD_BITS*(_a_words - _b_words);
	}
    
	while(BigCompare(_bWork, _a) != BIG.GREATER) //Repeat until B is larger than A
	{
	    if (_bWork[BIG_MAX_WORDS - 1] >= __BIG_HALF_MAX) //If B overflows (most significant bit is 1) then break out of this loop
	    {
	        __BigRShiftBit(_bWork); //B = B >> 1
	        --_exp;
	        break;
	    }
        
	    __BigLShiftBit(_bWork); //B = B << 1
	    ++_exp;
	}
    
	//Don't bother copying from A to Out if they're the same array
	if (_a != _out) BigCopyTo(_a, _out);
    
	repeat(_exp)
	{
	    if (BigCompare(_out, _bWork) != BIG.LESSER) //If A is greater than or equal to B
	    {
	        BigSub(_out, _bWork, 0); //A = A - B
	    }
        
	    __BigRShiftBit(_bWork); //B = B >> 1
	}
    
	return _out;
}