/// Big Integers
///
/// Based on:
/// https://github.com/kokke/tiny-bignum-c
/// https://github.com/ilia3101/Big-Integer-C

#macro __BIG_VERSION "0.3.1"
#macro __BIG_DATE "2023-10-07"
show_debug_message("BIG: Welcome to BIG Integers by @jujuadams! This is version " + __BIG_VERSION + ", " + __BIG_DATE);

#macro __BIG_WORD_BITS 32
#macro __BIG_MAX_VALUE 0xffffffff
#macro __BIG_HALF_MAX  0x80000000

#macro __BIG_HANDLE_RESULT_PRE if (_writeTo == 0)\
                               {\
                                   var _out = _a;\
                               }\
                               else if (_writeTo == 1)\
                               {\
                                   var _out = _b;\
                               }\
                               else if (_writeTo == undefined)\
                               {\
                                   var _out = BigZero();\
                               }\
                               else if (is_array(_writeTo))\
                               {\
                                   var _out = _writeTo;\
                               }\
                               else\
                               {\
                                   show_error("BIG:\n[writeTo] argument must be 0, 1, or <undefined>\n ", true);\
                               }


#macro __BIG_HANDLE_RESULT_POST if (_writeTo == 0)\
                                {\
                                    return BigCopyTo(_result, _x);\
                                }\
                                else if (_writeTo == 1)\
                                {\
                                    return BigCopyTo(_result, _y);\
                                }\
                                else if (_writeTo == undefined)\
                                {\
                                    return _result;\
                                }\
                                else if (is_array(_writeTo))\
                                {\
                                    return BigCopyTo(_result, _writeTo);\
                                }\
                                else\
                                {\
                                    show_error("BIG:\n[writeTo] argument must be 0, 1, or <undefined>\n ", true);\
                                }