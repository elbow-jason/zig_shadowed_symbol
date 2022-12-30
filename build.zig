const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const lib = b.addStaticLibrary("simple_c_link", "src/main.zig");
    lib.setBuildMode(mode);
    lib.addIncludeDir("c_src");
    lib.install();

    const main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);
    main_tests.addIncludeDir("c_src");

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
