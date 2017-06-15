state("generals")
{
    byte cursorControl : "game.dat", 0x61A9C0, 0x48;
}

start
{
    return current.cursorControl == 0;
}

split
{
    return current.cursorControl == 0;
}

isLoading
{
    return current.cursorControl == 0;
}
