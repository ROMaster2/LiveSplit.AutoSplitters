state("SnakePass-Win64-Shipping")
{
    uint igt: "SnakePass-Win64-Shipping.exe", 0x02B21350, 0x7D0, 0x20, 0x730, 0x20, 0x744;
}

gameTime
{
    if (current.igt == 0)
        return TimeSpan.FromMilliseconds(0);
    else
        return TimeSpan.FromMilliseconds(Math.Exp(current.igt*8.4702432194/100000000)*5.9515758734688*Math.Pow(10,-37));
}
