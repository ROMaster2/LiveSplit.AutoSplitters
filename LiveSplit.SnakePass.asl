state("SnakePass-Win64-Shipping")
{
    float igt: "SnakePass-Win64-Shipping.exe", 0x02B21350, 0x7D0, 0x20, 0x730, 0x20, 0x744;
}

init
{
    vars.totalIGT = 0.0;
}

update
{
    if (current.igt == 0.0 && old.igt > 0.0)
        vars.totalIGT = vars.totalIGT + Convert.ToDouble(old.igt);
}

gameTime
{
    return TimeSpan.FromSeconds(vars.totalIGT + Convert.ToDouble(current.igt));
}
