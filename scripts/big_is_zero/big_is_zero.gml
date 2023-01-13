/// @param x

function big_is_zero(_x)
{
    static _zero = big_zero();
    return array_equals(_x, _zero);
}