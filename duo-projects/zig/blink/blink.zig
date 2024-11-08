const std = @import("std");
const wx = @cImport({
    "wiringx.h"
    });

pub fn main() !void {
    var board = "duo".*;
    const DUO_LED = 25;
    
    const stdout = std.io.getStdOut().writer();
    try stdout.print("hello\n", .{});

    _= wx.wiringXSetup(&duo,null);
    _= wx.pinMode(DUO_LED,wx.PINMODE_OUTPUT);

    while(true){
        try stdout.print("Duo Led GPIO {wiringX} %d: High\n",.{DUO_LED});
        _= wx.digitalWrite(DUO_LED, wx.HIGH);
        std.time.sleep(1000000000);
        try stdout.print("Duo Led GPIO {wiringX} %d: Low\n",.{DUO_LED});
        _= wx.digitalWrite(DUO_LED, wx.LOW);
        std.time.sleep(1000000000);
    }
}
