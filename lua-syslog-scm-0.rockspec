package = "lua-syslog"
version = "scm-0"

source = {
    url = "git://github.com/deba12/lua-syslog.git"
}

description = {
   summary = "Lua syslog client library",
   detailed = [[
      lua-syslog: lua syslog client library"
   ]],
   homepage = "https://github.com/deba12/lua-syslog",
   license = "MIT"
}

dependencies = {
   "lua >= 5.1"
}

build = {
   type = "builtin",
   copy_directories = {},
   modules = {
	syslog = {
	    "lsyslog.c"
	}
   },
    install = { lib = { "syslog.so" } }
}
