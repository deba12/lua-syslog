# makefile for lsyslog library for Lua

# change these to reflect your Lua installation
LUA=luajit
LUAINC=`pkg-config ${LUA} --cflags`
LUALIB=`pkg-config ${LUA} --libs`
LUABIN=luajit-2.0.0-beta9

# no need to change anything below here
CFLAGS= $(LUAINC) $(WARN) -fPIC -O3 $G
WARN= -pedantic -Wall -Werror

MYNAME= syslog
MYLIB= $(MYNAME)
T= $(MYLIB).so
OBJS= l$(MYLIB).o
TEST= test.lua

all:	test

test:	$T
	LUA_CPATH='./?.so' $(LUABIN) -l$(MYNAME) $(TEST)

o:	$(MYLIB).o

so:	$T

$T:	$(OBJS)
	$(CC) -o $@ -shared $(OBJS)

clean:
	rm -f $(OBJS) $T core core.* a.out


