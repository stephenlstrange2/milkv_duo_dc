const std = @import("std");

pub fn main() !void {
    // _ = std.fmt.comptimePrint("\nhello\n", .{});
    const stdout = std.io.getStdOut().writer();
    try stdout.print("hello\n", .{});
}
