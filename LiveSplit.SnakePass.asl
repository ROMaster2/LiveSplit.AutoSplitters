state("SnakePass-Win64-Shipping")
{
    double igt: "SnakePass-Win64-Shipping.exe", 0x02B21350, 0x7D0, 0x20, 0x730, 0x20, 0x744;
}

gameTime
{
    return TimeSpan.FromSeconds(current.igt);
}

start
{
    
}
