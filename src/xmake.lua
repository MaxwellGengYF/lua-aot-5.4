target('lua-compiler')
_config_project({
    project_kind = 'static'
})
add_deps('mimalloc')
add_files('luaot_header.c', 'lapi.c', 'lauxlib.c', 'lbaselib.c', 'lcode.c', 'lcorolib.c', 'lctype.c', 'ldblib.c',
    'ldebug.c', 'ldo.c', 'ldump.c', 'lfunc.c', 'lgc.c', 'linit.c', 'liolib.c', 'llex.c', 'lmathlib.c', 'lmem.c',
    'loadlib.c', 'lobject.c', 'lopcodes.c', 'loslib.c', 'lparser.c', 'lstate.c', 'lstring.c', 'lstrlib.c', 'ltable.c',
    'ltablib.c', 'ltm.c', 'lundump.c', 'lutf8lib.c', 'lzio.c')
add_includedirs('.', {
    public = true
})
target_end()

target('lua')
_config_project({
    project_kind = 'binary'
})
add_deps('lua-compiler')
add_files('lua.c')
target_end()

target('luac')
_config_project({
    project_kind = 'binary'
})
add_deps('lua-compiler')
add_files('luac.c')
target_end()

target('luaot')
_config_project({
    project_kind = 'binary'
})
add_deps('lua-compiler')
add_files('luaot.c', 'md5.c')
add_defines('LUAOT_USE_SWITCHES')
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
    project_kind = 'binary'
})
add_deps('lua-compiler', 'test_codegen')
add_files('template/*.lua')
add_rules('compile_lua')
target_end()
