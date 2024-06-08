target('lua-compiler')
_config_project({
    project_kind = 'static',
    no_rtti = true
})
add_deps('mimalloc')
add_files('luaot_header.cpp', 'lapi.cpp', 'lauxlib.cpp', 'lbaselib.cpp', 'lcode.cpp', 'lcorolib.cpp', 'lctype.cpp', 'ldblib.cpp',
    'ldebug.cpp', 'ldo.cpp', 'ldump.cpp', 'lfunc.cpp', 'lgc.cpp', 'linit.cpp', 'liolib.cpp', 'llex.cpp', 'lmathlib.cpp', 'lmem.cpp',
    'loadlib.cpp', 'lobject.cpp', 'lopcodes.cpp', 'loslib.cpp', 'lparser.cpp', 'lstate.cpp', 'lstring.cpp', 'lstrlib.cpp', 'ltable.cpp',
    'ltablib.cpp', 'ltm.cpp', 'lundump.cpp', 'lutf8lib.cpp', 'lzio.cpp', 'lvm.cpp')
add_includedirs('.', {
    public = true
})
add_defines("LUAOT_USE_GOTOS", "LUA_USE_LONGJMP", {public = true});
target_end()

target('lua')
_config_project({
    project_kind = 'binary',
    no_rtti = true
})
add_deps('lua-compiler')
add_files('lua.cpp')
target_end()

target('luac')
_config_project({
    project_kind = 'binary',
    no_rtti = true
})
add_deps('lua-compiler')
add_files('luac.cpp')
target_end()

target('luaot')
_config_project({
    project_kind = 'binary',
    no_rtti = true
})
add_deps('lua-compiler')
add_files('luaot.cpp', 'md5.cpp')
target_end()

target('test_codegen')
set_kind('object')
add_files('template/*.lua')
add_rules('codegen_lua')
set_policy("build.across_targets_in_parallel", false)
add_deps('luaot')
target_end()

target('test')
_config_project({
    project_kind = 'binary',
    no_rtti = true
})
add_deps('lua-compiler', 'test_codegen')
add_files('template/*.lua', "template/regist.cpp")
add_rules('compile_lua')
target_end()
