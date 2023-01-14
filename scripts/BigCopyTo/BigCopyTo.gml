 /// @param source
/// @param destination

function BigCopyTo(_source, _destination)
{
	array_copy(_destination, 0, _source, 0, BIG_MAX_WORDS);
	return _destination;
}