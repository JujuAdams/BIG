/// @param x

function BigIsZero(_x)
{
    static _zero = BigZero();
    return array_equals(_x, _zero);
}