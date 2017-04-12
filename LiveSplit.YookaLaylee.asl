state("YookaLaylee64")
{
    bool isLoad : "YookaLaylee64.exe", 0x1325088, 0x2EC;
}

isLoading
{
    return current.isLoad;
}
