const std = @import("std");
const mem = std.mem;

pub fn getEndOfStart(c: u8) ?u8 {
    return switch (c) {
        '(' => ')',
        '[' => ']',
        '{' => '}',
        else => null,
    };
}

pub fn isEnd(c: u8) bool {
    return c == ')' or c == ']' or c == '}';
}

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var ends = std.ArrayList(u8).init(allocator);
    defer ends.deinit();

    for (s) |c| {
        const maybeEnd = getEndOfStart(c);
        if (maybeEnd) |end| {
            try ends.append(end);
        } else if (isEnd(c)) {
            const last = ends.popOrNull();
            if (last != c) {
                return false;
            }
        }
    }
    return ends.items.len == 0;
}
