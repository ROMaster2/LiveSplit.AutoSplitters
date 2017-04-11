state("snakepass")
{
    uint testing : 0x25A83FF24E8, 0x58, 0x188, 0x780, 0x700, 0x6D8;
}

start
{
    return (current.testing != 0 && old.testing == 0);
}
