state("SnakePass-Win64-Shipping")
{
    float igt: "SnakePass-Win64-Shipping.exe", 0x02B21350, 0x7D0, 0x20, 0x730, 0x20, 0x744;
}

init
{
    vars.totalIGT = 0f;
}

update
{
    if (timer.CurrentTime.RealTime < TimeSpan.FromSeconds(1.0))
        vars.totalIGT = 0f;
    if (current.igt == 0f && old.igt > 0f)
        vars.totalIGT = vars.totalIGT + old.igt;
}

gameTime
{
    return TimeSpan.FromSeconds(Convert.ToDouble(vars.totalIGT + current.igt));
}
