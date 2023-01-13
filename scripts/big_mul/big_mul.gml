/// @param x
/// @param y

function big_mul(_x, _y)
{
	return __big_mul_internal(_x, big_word_count(_x),
	                          _y, big_word_count(_y));
}

/// @param x
/// @param xWords
/// @param y
/// @param yWords
function __big_mul_internal(_x, _x_words, _y, _y_words)
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
    
	if (_x_words <= 0) return big_zero();
	if (_y_words <= 0) return big_zero();
	if ((_x_words == 1) && (_y_words == 1)) return big_from_int(int64(_x[0])*int64(_y[0]));
    
	var _split = max(_x_words, _y_words) div 2;
    
	var _a = __big_rshift_word(big_duplicate(_x), _split);
	var _b = __big_limit_words(big_duplicate(_x), _split);
	var _c = __big_rshift_word(big_duplicate(_y), _split);
	var _d = __big_limit_words(big_duplicate(_y), _split);
    
	var _i = __big_mul_internal(_a, _x_words - _split, _c, _y_words - _split);
	var _j = __big_mul_internal(_b, _split, _d, _split);
	var _k = big_mul(big_add(_a, _b, 0),  //Reuse _a
	                 big_add(_c, _d, 0)); //Reuse _c
	         big_sub(_k, _i, 0);
	         big_sub(_k, _j, 0);
    
	__big_lshift_word(_i, 2*_split);
	__big_lshift_word(_k, _split);
    
	return big_add(_i, big_add(_j, _k, 0), 0); //Reuse _i and _j
}