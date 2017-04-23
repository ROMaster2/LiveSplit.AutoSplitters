state("SnakePass-Win64-Shipping")
{
    float igt: "SnakePass-Win64-Shipping.exe", 0x2B21350, 0x7D0, 0x20, 0x730, 0x20, 0x744;
    bool paused: "SnakePass-Win64-Shipping.exe", 0x2B02560, 0x38, 0x0, 0x0, 0x380, 0x78;
    uint starter: "SnakePass-Win64-Shipping.exe", 0x286F1A8, 0x348;
}

init
{
    vars.totalIGT = 0f;
    vars.splitter = false;
}

update
{
    if (timer.CurrentTime.RealTime < TimeSpan.FromSeconds(1.0))
        vars.totalIGT = 0f;
    if (current.igt == 0f && old.igt > 0f)
        vars.totalIGT = vars.totalIGT + old.igt;
    if (current.igt == old.igt && current.igt > 1f && timer.Run[timer.CurrentSplitIndex - 1].SplitTime.RealTime > TimeSpan.FromSeconds(30.0))
        vars.splitter = true;
}

gameTime
{
    return TimeSpan.FromSeconds(Convert.ToDouble(vars.totalIGT + current.igt));
}

split
{
    if (vars.splitter)
    {
        vars.splitter = false;
        return true;
    }
}

start
{
//    return (current.starter != old.starter); //Unstable
}
