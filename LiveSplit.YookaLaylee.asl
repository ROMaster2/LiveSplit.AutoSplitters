state("YookaLaylee64")
{
    bool isLoad1: "YookaLaylee64.exe", 0x1325088, 0x2EC;
    byte isLoad2: "AkSoundEngine.dll", 0x1A2FB8; // Thanks TRS
    uint starter: "YookaLaylee64.exe", 0x13218E8, 0x78, 0x10, 0x20, 0x64;
//  uint slot0gametime : "YookaLaylee64.exe", 0x01298200, 0xA48, 0x5D0, 0x88;
}

start
{
    return (current.starter == 65536 && old.starter < 2);
}

isLoading
{
   return (!current.isLoad1 && current.isLoad2 < 3);
}
