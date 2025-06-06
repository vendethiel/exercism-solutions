const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    if (limit < 2) return &[0]u32{};
    var mark = std.StaticBitSet(limit + 1).initFull();
    var n: u32 = 2;
    var p: u32 = 0;
    while (n <= limit) : (n += 1) {
        if (!mark.isSet(n)) continue;
        var bound = n + n;
        while (bound <= limit) : (bound += n) {
            mark.unset(bound);
        }
        buffer[p] = n;
        p += 1;
    }
    return buffer[0..p];
}
