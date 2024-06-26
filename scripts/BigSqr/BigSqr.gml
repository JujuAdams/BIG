/// Multiplies a BIG number by itself and returns the result
/// 
/// How this function returns is determined by the "writeTo" argument:
///   writeTo = undefined:     A new BIG container is generated and returned
///   writeTo = 0:             BIG number "x" is used to hold the resulting value, and "x" is returned by the function
///   writeTo = <BIG number>:  The result overwrites the target BIG number
/// 
/// @param x
/// @param [writeTo]

function BigSqr(_x, _writeTo = undefined)
{
	var _result = __BigSqrInternal(_x, BigWordCount(_x));
    
    __BIG_HANDLE_RESULT_POST
}

/// @param x
/// @param words
function __BigSqrInternal(_x, _words)
{
	/// XX = Y
	/// 
	/// h = floor(max(word length of X, word length of Y) / 2)
	/// X  = (a << h) + b
	/// XX = ((a << h) + b)((a << h) + b)
	/// XX = (aa << 2h) + (2ab << h) + bb
	/// 
	/// i = aa
	/// j = ab
	/// k = bb
	/// 
	/// Z = i << 2h
	///   + j <<  h
	///   + k
    
	if (_words <= 0) return BigZero();
	if (_words == 1) return BigFromInteger(int64(_x[0])*int64(_x[0]));
    
	var _split = _words div 2;
    
	var _a = __BigRShiftWord(BigDuplicate(_x), _split);
	var _b = __BigLimitWords(BigDuplicate(_x), _split);
    
	var _i = __BigSqrInternal(_a, _words - _split);
	var _j = __BigMulInternal(_a, _words - _split, _b, _split);
	var _k = __BigSqrInternal(_b, _split);
    
	__BigLShiftWord(_i, 2*_split);
	__BigLShiftWord(_j, _split);
    
	return BigAdd(_i, BigAdd(_j, BigAdd(_j, _k, 1), _k), 0); //Reuse _i and _k
}