#pragma once
typedef struct lua_State lua_State;
struct RegistClass {
  RegistClass(char const *name, int (*ptr)(lua_State *));
};
