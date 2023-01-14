randomize();

a_string = string(irandom_range(1, 9));
b_string = string(irandom_range(1, 9));

repeat(irandom_range(3, 20)) a_string += string(irandom(9));
repeat(irandom_range(3, 20)) b_string += string(irandom(9));

a = BigFromDecString(a_string);
b = BigFromDecString(b_string);

var _t = get_timer();
c = BigMul(a, b);
d = BigDiv(c, b);
e = BigDiv(c, a);
_t = get_timer() - _t;

c_string = BigToDecString(c);
d_string = BigToDecString(d);
e_string = BigToDecString(e);

if ((a_string != d_string) || (b_string != e_string))
{
    show_debug_message("ERROR!    " + a_string + "  *  " + b_string + "  !=  " + d_string + "  *  " + e_string + "    ERROR!");
}

count++;

if (current_time - last_output > 1000)
{
    show_debug_message("time=" + string(current_time) + ", i=" + string(count) + ", t=" + string(_t) + ":    " + a_string + "  *  " + b_string + "  ===  " + c_string + " === " + d_string + "  *  " + e_string);
    last_output = current_time;
}