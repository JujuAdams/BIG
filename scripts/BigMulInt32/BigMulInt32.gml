/// Multiplies a BIG number by a 32-bit integer and returns the result
/// 
/// How this function returns is determined by the "writeTo" argument:
///   writeTo = undefined:     A new BIG container is generated and returned
///   writeTo = 0:             BIG number "x" is used to hold the resulting value, and "x" is returned by the function
///   writeTo = <BIG number>:  The result overwrites the target BIG number
/// 
/// @param x
/// @param int32
/// @param [writeTo]

function BigMulInt32(_x, _int, _writeTo = undefined)
{
    __BIG_HANDLE_RESULT_PRE_MONO
    
	var _i = BIG_MAX_WORDS-1;
	repeat(BIG_MAX_WORDS)
	{
	    var _temp = BigFromInteger(_x[_i] * _int);
	    __BigLShiftWord(_temp, _i);
        
        //Special handling for overwriting the input array
        _out[@ _i] = _temp[_i];
        _temp[@ _i] = 0;
        
	    BigAdd(_out, _temp, 0);
        
	    --_i;
	}
    
	return _out;
}