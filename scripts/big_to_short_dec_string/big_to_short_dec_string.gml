/// @param x

function big_to_short_dec_string(_x)
{
    static _suffix_array = [
        "K",  //thousand
        "M",  //million
        "B",  //billion
        "Qd", //quadrillion
        "Qt", //quintillion
        "Sx", //sextillion
        "Sp", //septillion
        "Oc", //octillion
        "No", //nonillion
    ];
    
	var _string = big_to_dec_string(_x);
    
    var _t = get_timer();
    var _length = string_byte_length(_string);
    if (_length <= 3) return _length;
    
    _string = string_copy(_string, 1, 3);
    
    var _block = (_length-1) div 3;
    var _suffix = _suffix_array[_block-1];
    
    _block *= 3;
    if (_length - _block == 1)
    {
        _string = string_insert(".", _string, 2);
    }
    else if (_length - _block == 2)
    {
        _string = string_insert(".", _string, 3);
    }
    
    return _string + _suffix;;
}