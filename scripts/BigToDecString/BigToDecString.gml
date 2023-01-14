/// @param x

function BigToDecString(_x)
{
    static _y = BigZero();
    BigCopyTo(_x, _y);
    
	var _string = "";
	while(true)
	{
        var _isZero = true;
        var _carry = 0;
        
        var _i = BIG_MAX_WORDS-1;
        repeat(BIG_MAX_WORDS)
        {
            var _s = _y[_i];
            if (_s != 0) _isZero = false;
            _s += _carry*(__BIG_MAX_VALUE+1);
            
            _y[@ _i] = _s div 10;
            _carry = _s % 10;
            
            --_i;
        }
        
        if (_isZero) break;
        _string = string(_carry) + _string;
	}
    
	return _string;
}