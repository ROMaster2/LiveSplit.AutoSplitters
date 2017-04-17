state("YookaLaylee64")
{
    bool isLoad : "YookaLaylee64.exe", 0x1325088, 0x2EC;
    uint timeThing : "YookaLaylee64.exe", 0x012979D0, 0x4C0, 0x50, 0x318;
    uint starter : "YookaLaylee64.exe", 0x01299930, 0x720, 0x64;
  //slot0 gametime "YookaLaylee64.exe", 0x01298200, 0xA48, 0x5D0, 0x88;
}

start
{
    return (current.starter == 65536 && old.starter == 1);
}

isLoading
{
    return (current.isLoad && current.timeThing < 3);
}
