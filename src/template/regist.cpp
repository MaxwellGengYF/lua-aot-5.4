#include <utility>
#include <vector>
#include "regist.hpp"
extern "C" {
#include "lua.h"
#include "lauxlib.h"
}
static std::vector<std::pair<char const *, int (*)(lua_State *)>> funcs;
extern "C" void load_preload_functions(lua_State *L) {
  for (auto &&i : funcs) {
    luaL_getsubtable(L, LUA_REGISTRYINDEX, LUA_PRELOAD_TABLE);
    lua_pushcfunction(L, i.second);
    lua_setfield(L, -2, i.first);
    lua_pop(L, 1);
  }
}
RegistClass::RegistClass(char const *name, int (*ptr)(lua_State *)) {
  funcs.emplace_back(name, ptr);
}