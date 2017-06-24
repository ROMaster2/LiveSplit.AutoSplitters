state("SnakePass-Win64-Shipping")
{
    float igt: "SnakePass-Win64-Shipping.exe", 0x2B26550, 0xE8, 0x744;
    byte map: "SnakePass-Win64-Shipping.exe", 0x2B26550, 0x138, 0x190;
    byte menu: "SnakePass-Win64-Shipping.exe", 0x2874659;//7
}

init
{
    vars.totalIGT = 0f;
}

update
{
    if (current.igt == 0f && old.igt > 0f && current.map != 0)
        vars.totalIGT = vars.totalIGT + old.igt;
    if (timer.CurrentTime.RealTime < TimeSpan.FromSeconds(1.0))
        vars.totalIGT = 0f;
}

isLoading
{
    return true;
}

gameTime
{
    return TimeSpan.FromSeconds(vars.totalIGT + current.igt); //change when patched
}

start
{
    return (current.map == 0 && current.menu == 7);
}
