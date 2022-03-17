#define _XOPEN_SOURCE_EXTENDED
#if __APPLE__
    #include "include/ncurses.h"
    #include "include/ncursesw/menu.h"
    #include "include/ncursesw/panel.h"
#elif __linux__
    #include <ncurses.h>
    #include <menu.h>
    #include <panel.h>
#endif
