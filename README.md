# Zig Shadowed Symbol

This is a simple reproduction of what I believe is zig getting symbols confused between Zig and C.

## Reproduction

Run `zig build test` and look for the failure `Test [2/2] test "basic add imported from C"... thread 6302724 panic: it was "zig"`

## Details

### Version

```
❯ zig version
0.10.0-dev.3587+9d85335de
```

### Uname

```
❯ uname -a
Darwin Jasons-MacBook-Pro.local 21.4.0 Darwin Kernel Version 21.4.0: Fri Mar 18 00:47:26 PDT 2022; root:xnu-8020.101.4~15/RELEASE_ARM64_T8101 arm64
```

### My Test Output

```
❯ zig build test
Test [2/2] test "basic add imported from C"... thread 6305230 panic: it was "zig"
/Users/jason/Workspace/zigs/zig_shadowed_symbol/src/main.zig:22:9: 0x10436b8d7 in test "basic add imported from C" (test)
        @panic("it was \"zig\"");
        ^
/Users/jason/.asdf/installs/zig/master/lib/zig/test_runner.zig:79:28: 0x10436ddbf in (root).main (test)
        } else test_fn.func();
                           ^
/Users/jason/.asdf/installs/zig/master/lib/zig/std/start.zig:566:22: 0x10436f547 in std.start.main (test)
            root.main();
                     ^
???:?:?: 0x104695087 in ??? (???)
???:?:?: 0x9e647fffffffffff in ??? (???)
error: the following test command crashed:
/Users/jason/Workspace/zigs/zig_shadowed_symbol/zig-cache/o/eb208f6ab4c74c15eba88365b9af22a3/test /Users/jason/.asdf/installs/zig/master/zig
error: test...
error: The following command exited with error code 1:
/Users/jason/.asdf/installs/zig/master/zig test /Users/jason/Workspace/zigs/zig_shadowed_symbol/src/main.zig --cache-dir /Users/jason/Workspace/zigs/zig_shadowed_symbol/zig-cache --global-cache-dir /Users/jason/.cache/zig --name test -I /Users/jason/Workspace/zigs/zig_shadowed_symbol/c_src --enable-cache
error: the following build command failed with exit code 1:
/Users/jason/Workspace/zigs/zig_shadowed_symbol/zig-cache/o/f5e049bdfdf117085a5f97d2c3472a63/build /Users/jason/.asdf/installs/zig/master/zig /Users/jason/Workspace/zigs/zig_shadowed_symbol /Users/jason/Workspace/zigs/zig_shadowed_symbol/zig-cache /Users/jason/.cache/zig test
```
