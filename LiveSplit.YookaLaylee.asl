state("YookaLaylee64")
{
    bool isLoad : "YookaLaylee64.exe", 0x1325088, 0x2EC;
    uint timeThing : "YookaLaylee64.exe", 0x133E2C8, 0x648, 0x1C8, 0x338, 0x98;
    uint starter : "YookaLaylee64.exe", 0x10D58E8, 0x10, 0x2E0, 0xFB4;
  //uint slot0gametime : "YookaLaylee64.exe", 0x01298200, 0xA48, 0x5D0, 0x88;
}

start
{
    return (current.starter == 65536 && old.starter == 1);
}

isLoading
{
    return (current.isLoad && current.timeThing < 3);
}
