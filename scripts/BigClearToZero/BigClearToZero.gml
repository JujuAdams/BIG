/// Resets all values in a BIG number container to zero
/// 
/// @param bigNumber

function BigClearToZero(_number)
{
    //TODO - Optimise with new functions in GM 2022.11
    
    var _i = 0;
    repeat(BIG_MAX_WORDS)
    {
        _number[@ _i] = 0;
        ++_i;
    }
}