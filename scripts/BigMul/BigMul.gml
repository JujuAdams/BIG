/// @param x
/// @param y

function BigMul(_x, _y)
{
	return __BigMulInternal(_x, BigWordCount(_x),
	                        _y, BigWordCount(_y));
}

/// @param x
/// @param xWords
/// @param y
/// @param yWords
function __BigMulInternal(_x, _x_words, _y, _y_words)
{
	/// XY = Z
	/// 
	/// h = floor(max(word length of X, word length of Y) / 2)
	/// X = (a << h) + b
	/// Y = (c << h) + d
	/// XY = (ac << 2h) + ((ad + bc) << h) + bd
	/// 
	/// i = ac
	/// j = bd
	/// k = (a + b)(c + d) = ac + ad + bc + bd
	/// ad + bc = (a + b)(c + d) - i - j
	/// 
	/// Z = i << 2h
	///   + j
	///   + k << h
    
	if (_x_words <= 0) return BigZero();
	if (_y_words <= 0) return BigZero();
	if ((_x_words == 1) && (_y_words == 1)) return BigFromInt(int64(_x[0])*int64(_y[0]));
    
	var _split = max(_x_words, _y_words) div 2;
    
	var _a = __BigRShiftWord(BigDuplicate(_x), _split);
	var _b = __BigLimitWords(BigDuplicate(_x), _split);
	var _c = __BigRShiftWord(BigDuplicate(_y), _split);
	var _d = __BigLimitWords(BigDuplicate(_y), _split);
    
	var _i = __BigMulInternal(_a, _x_words - _split, _c, _y_words - _split);
	var _j = __BigMulInternal(_b, _split, _d, _split);
	var _k = BigMul(BigAdd(_a, _b, 0),  //Reuse _a
	                BigAdd(_c, _d, 0)); //Reuse _c
	         BigSub(_k, _i, 0);
	         BigSub(_k, _j, 0);
    
	__BigLShiftWord(_i, 2*_split);
	__BigLShiftWord(_k, _split);
    
	return BigAdd(_i, BigAdd(_j, _k, 0), 0); //Reuse _i and _j
}