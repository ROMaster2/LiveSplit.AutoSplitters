state("snakepass")
{
    uint igt: "SnakePass-Win64-Shipping.exe", 0x0286D7F0, 0x7A8, 0x180, 0x128, 0x560, 0x744;
}

gameTime
{
    if (current.igt == 0)
        return TimeSpan.FromMilliseconds(0);
    else
        return TimeSpan.FromMilliseconds(6.8883980017*Math.Pow(10,-45)*Math.Exp(8.4702432194*Math.Pow(10,-8)*current.igt)*86400000);
}
