/// @param x

function big_sqr(_x)
{
	return __big_sqr_internal(_x, big_word_count(_x));
}

/// @param x
/// @param words
function __big_sqr_internal(_x, _words)
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
    
	if (_words <= 0) return big_zero();
	if (_words == 1) return big_from_int(int64(_x[0])*int64(_x[0]));
    
	var _split = _words div 2;
    
	var _a = __big_rshift_word(big_duplicate(_x), _split);
	var _b = __big_limit_words(big_duplicate(_x), _split);
    
	var _i = __big_sqr_internal(_a, _words - _split);
	var _j = __big_mul_internal(_a, _words - _split, _b, _split);
	var _k = __big_sqr_internal(_b, _split);
    
	__big_lshift_word(_i, 2*_split);
	__big_lshift_word(_j, _split);
    
	return big_add(_i, big_add(_j, big_add(_j, _k, 1), _k), 0); //Reuse _i and _k
}