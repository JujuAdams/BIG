/// @param source
/// @param destination

function big_copy_to(_source, _destination)
{
	array_copy(_destination, 0, _source, 0, BIG_MAX_WORDS);
	return _destination;
}