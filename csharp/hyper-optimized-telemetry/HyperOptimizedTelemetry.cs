using System;
using System.Collections.Generic;

public static class TelemetryBuffer
{
    private static byte Prefix(long reading)
    {
        return reading switch
        {
            > uint.MaxValue => 256 - 8,
            > int.MaxValue => 4,
            > ushort.MaxValue => 256 - 4,
            >= 0 => 2,
            >= short.MinValue => 256 - 2,
            >= int.MinValue => 256 - 4,
            _ => 256 - 8
        };
    }
    
    public static byte[] ToBuffer(long reading)
    {
        var buffer = new byte[9];
        buffer[0] = Prefix(reading);
        var count = buffer[0] > 8 ? 256 - buffer[0] : buffer[0];
        Buffer.BlockCopy(BitConverter.GetBytes(reading), 0, 
            buffer, 1, count);    ;
        return buffer;
    }

    public static long FromBuffer(byte[] buffer)
    {
        int prefix = buffer[0];
        var allowed = new HashSet<int> {248, 252, 254, 2, 4};
        if (!allowed.Contains(prefix)) return 0;
        
        var count = prefix > 8 ? 256 - prefix : prefix;
        var payload = new byte[count];
        Buffer.BlockCopy(buffer, 1, payload, 0, count);
        return prefix switch
        {
            2 => BitConverter.ToUInt16(payload, 0),
            4 => BitConverter.ToUInt32(payload, 0),
            256 - 8 => BitConverter.ToInt64(payload, 0),
            256 - 4 => BitConverter.ToInt32(payload, 0),
            256 - 2 => BitConverter.ToInt16(payload, 0),
            _ => 0
        };
    }
}
