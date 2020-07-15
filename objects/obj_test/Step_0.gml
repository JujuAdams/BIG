randomize();

a_string = string(irandom_range(1, 9));
b_string = string(irandom_range(1, 9));

repeat(irandom_range(3, 40)) a_string += string(irandom(9));
repeat(irandom_range(3, 40)) b_string += string(irandom(9));

a = big_from_dec_string(a_string);
b = big_from_dec_string(b_string);

var _t = get_timer();
c = big_mul(a, b);
d = big_div(c, b);
e = big_div(c, a);
_t = get_timer() - _t;

c_string = big_to_dec_string(c);
d_string = big_to_dec_string(d);
e_string = big_to_dec_string(e);

if ((a_string != d_string) || (b_string != e_string))
{
    show_debug_message("ERROR!    " + a_string + "  *  " + b_string + "  !=  " + d_string + "  *  " + e_string + "    ERROR!");
}

count++;

if (current_time - last_output > 10000)
{
    show_debug_message("time=" + string(current_time) + ", i=" + string(count) + ", t=" + string(_t) + ":    " + a_string + "  *  " + b_string + "  ===  " + c_string + " === " + d_string + "  *  " + e_string);
    last_output = current_time;
}