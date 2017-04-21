state("YookaLaylee64")
{
    bool isLoad: "YookaLaylee64.exe", 0x1325088, 0x2EC;
    uint starter: "YookaLaylee64.exe", 0x13218E8, 0x78, 0x10, 0x20, 0x64;
    uint timeThing: "steamclient64.dll", 0x00C3E508, 0x70 0xb28, 0x5d8, 0x180, 0x98;
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
