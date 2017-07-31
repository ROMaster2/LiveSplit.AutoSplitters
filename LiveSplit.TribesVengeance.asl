state("TV_CD_DVD")
{
//  byte isLoad : "Engine.dll", 0x775990, 0x80, 0x4, 0xC14;
    float zAxis : "Engine.dll", 0x775990, 0x50;
    string24 map : "TV_CD_DVD.exe", 0x78D50, 0x474, 0x2C8, 0x60, 0x0;
}

start
{
    //stupid floats won't allow precision
    return (old.zAxis < -1216.25 && old.zAxis > -1216.26 && 
    (current.zAxis >= -1216.25 || current.zAxis <= -1216.26) && 
    !(current.zAxis < -1202.25 && current.zAxis > -1202.26) &&
    !(current.zAxis < -1303.83 && current.zAxis > -1303.84));
}
    
reset
{
    return (current.zAxis < -1216.25 && current.zAxis > -1216.26 && old.zAxis == 300);
}

split
{
    return current.map != old.map;
}

isLoading
{
    return current.zAxis == 300;
}
