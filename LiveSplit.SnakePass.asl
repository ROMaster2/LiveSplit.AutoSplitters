state("SnakePass-Win64-Shipping")
{
    float igt: "SnakePass-Win64-Shipping.exe", 0x2B21350, 0x7D0, 0x20, 0x730, 0x20, 0x744;
    bool paused: "SnakePass-Win64-Shipping.exe", 0x2B221A0, 0x208, 0x40, 0x2F0, 0x168, 0x78;
    uint starter: "SnakePass-Win64-Shipping.exe", 0x2B1FC70, 0x80, 0x2B, 0x180, 0x4F8, 0xD0;
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
/*
split
{
    return (current.igt == old.igt && current.igt > 1f && !current.paused && !old.paused);
}
*/
start
{
    return (current.starter > 1662 && old.starter == 1662);
}
