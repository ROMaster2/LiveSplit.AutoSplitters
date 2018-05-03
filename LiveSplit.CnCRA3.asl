state("RA3_1.12.game")
{
    uint igt : "RA3_1.12.game", 0x8EEDEC;
}

start
{
    return (current.igt > 0 && old.igt == 0);
}

isLoading
{
    return true;
}

gameTime
{
    return TimeSpan.FromMilliseconds(current.igt);
}
