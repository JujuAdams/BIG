randomize();

stringA = string(irandom_range(1, 9));
stringB = string(irandom_range(1, 9));

repeat(irandom_range(3, 20)) stringA += string(irandom(9));
repeat(irandom_range(3, 20)) stringB += string(irandom(9));

a = BigFromDecimalString(stringA);
b = BigFromDecimalString(stringB);

var _t = get_timer();
c = BigMul(a, b);
d = BigDiv(c, b);
e = BigDiv(c, a);
_t = get_timer() - _t;

stringC = BigToDecimalString(c);
stringD = BigToDecimalString(d);
stringE = BigToDecimalString(e);

if ((stringA != stringD) || (stringB != stringE))
{
    show_debug_message("ERROR!    " + stringA + "  *  " + stringB + "  !=  " + stringD + "  *  " + stringE + "    ERROR!");
}

count++;

if (current_time - lastOutput > 1000)
{
    show_debug_message("time=" + string(current_time) + ", i=" + string(count) + ", t=" + string(_t) + ":    " + stringA + "  *  " + stringB + "  ===  " + stringC + " === " + stringD + "  *  " + stringE);
    lastOutput = current_time;
}