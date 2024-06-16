/// Adds a 32-bit integer to a BIG number and returns the result
/// 
/// How this function returns is determined by the "writeTo" argument:
///   writeTo = undefined:     A new BIG container is generated and returned
///   writeTo = 0:             BIG number "x" is used to hold the resulting value, and "x" is returned by the function
///   writeTo = <BIG number>:  The result overwrites the target BIG number
/// 
/// @param x
/// @param int32
/// @param [writeTo]

function BigAddInt32(_x, _int, _writeTo = undefined)
{
    __BIG_HANDLE_RESULT_PRE_MONO
    
	var _temp = _x[0] + _int;
	var _carry = (_temp > __BIG_MAX_VALUE);
	_out[@ 0] = _temp & __BIG_MAX_VALUE;
    
	var _i = 1;
	repeat(BIG_MAX_WORDS - 1)
	{
	    var _temp = _x[_i] + _carry;
	    _carry = (_temp > __BIG_MAX_VALUE);
	    _out[@ _i] = _temp & __BIG_MAX_VALUE;
        
	    ++_i;
	}
    
	return _out;
}