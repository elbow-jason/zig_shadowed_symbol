const std = @import("std");
const testing = std.testing;

const c = @cImport({
    @cInclude("my_lib.h");
});

export fn my_func() [*c]const u8 {
    return "zig";
}

test "basic add functionality" {
    const raw_from = my_func();
    const from = std.mem.span(raw_from);
    try testing.expect(std.mem.eql(u8, from, "zig"));
}

test "basic add imported from C" {
    const raw_from = c.my_func();
    const from = std.mem.span(raw_from);
    if (std.mem.eql(u8, from, "zig")) {
        @panic("it was \"zig\"");
    }
    if (std.mem.eql(u8, from, "c")) {
        return;
    }
    @panic("it was invalid");
}
