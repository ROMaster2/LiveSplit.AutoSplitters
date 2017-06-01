state("SnakePass-Win64-Shipping")
{
    float igt: "SnakePass-Win64-Shipping.exe", 0x2B21350, 0x7D0, 0x20, 0x730, 0x20, 0x744;
//  float igt: "SnakePass-Win64-Shipping.exe", 0x2A67E08, 0x78, 0x140, 0x0, 0x2D8, 0x744;
}

init
{
    refreshRate = 20;
}

isLoading
{
    return current.igt <= old.igt;
}
