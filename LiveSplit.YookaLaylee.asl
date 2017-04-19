state("YookaLaylee64")
{
    bool isLoad : "YookaLaylee64.exe", 0x1325088, 0x2EC;
  //uint timeThing : "YookaLaylee64.exe", 0x133E2C8, 0x648, 0x1C8, 0x338, 0x98;//orig
  //uint timeThing : "YookaLaylee64.exe", 0x131ECE0, 0xE0, 0xE88, 0x1F0, 0x60, 0x7D8;
  //uint timeThing3 : "YookaLaylee64.exe", 0x133E2C8, 0x6B8, 0x460, 0x708, 0x0, 0x498;
  //uint timeThing1 : "YookaLaylee64.exe", 0x131D1E0, 0x4C0, 0x18, 0xB0, 0x30, 0x798;
  //uint timeThing2 : "YookaLaylee64.exe", 0x1272DF0, 0x98, 0x5C8, 0xF0, 0x708, 0xCC;
    uint starter : "YookaLaylee64.exe", 0x13218E8, 0x78, 0x10, 0x20, 0x64;
  //uint slot0gametime : "YookaLaylee64.exe", 0x01298200, 0xA48, 0x5D0, 0x88;
    uint listener01 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x490;
    uint listener02 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x494;
    uint listener03 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x498;
    uint listener04 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x4A4;
    uint listener05 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x4A8;
    uint listener06 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x4B0;
    uint listener07 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x4B4;
    uint listener08 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x4B8;
    uint listener09 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x4C0;
    uint listener10 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x4C4;
    uint listener11 : "YookaLaylee64.exe", 0x118475C, 0x20, 0x4C8;
}

start
{
    return (current.starter == 65536 && old.starter < 2);
}

isLoading
{
//  return (current.isLoad && current.timeThing < 3);
    return (current.isLoad && current.listener01 == 1065353216 && current.listener02 == 0 && current.listener03 == 0 && current.listener04 == 1065353216 && current.listener05 == 0 && current.listener06 == 0 && current.listener07 == 0 && current.listener08 == 3212836864 && current.listener09 == 3323742884 && current.listener10 == 3323740545 && current.listener11 == 1176247849);
}
