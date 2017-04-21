state("YookaLaylee64")
{
    bool isLoad: "YookaLaylee64.exe", 0x1325088, 0x2EC;
    uint starter: "YookaLaylee64.exe", 0x13218E8, 0x78, 0x10, 0x20, 0x64;
    uint timeThing: "YookaLaylee64.exe", 0x133E2C8, 0x7C8, 0x300, 0x788, 0x338, 0x98;
//  uint slot0gametime : "YookaLaylee64.exe", 0x01298200, 0xA48, 0x5D0, 0x88;
}

start
{
    return (current.starter == 65536 && old.starter < 2);
}

isLoading
{
   return (current.isLoad && current.timeThing < 3);
}
