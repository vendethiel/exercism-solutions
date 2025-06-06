const std = @import("std");
const ceil = std.math.ceil;
const pow = std.math.pow;
const ArrayList = std.ArrayList;
const buffer_len = 200; // this exercise is dogshit
const mark_len = 1500;

pub fn primes(buffer: []u32, limit: u32) []u32 {
    var mark = [_]bool{true} ** mark_len;
    if (limit < 2) return &[0]u32{};
    var n: u32 = 2;
    while (n <= limit) : (n += 1) {
        if (mark[n]) {
            var bound = pow(u64, n, 2);
            while (bound <= limit and bound < mark_len) : (bound += n) {
                mark[bound] = false;
            }
        }
    }

    var max: usize = 0;
    n = 2;
    while (n <= limit) : (n += 1) {
        if (mark[n]) {
            buffer[max] = n;
            max += 1;
        }
    }
    return buffer[0..max];
}
