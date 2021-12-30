# SwiftCurses
A wrapper around the ncurses library


### MacOS Notes
## ncurses official page https://invisible-island.net/ncurses/ncurses.faq.html

The Darwin Module already comes shipped with a version of ncurses, but is terribly out of date (version 5.8 at last check) and a major cause of headaches.  Since basically every other package will touch Foundation when trying to compile with an alternate version of ncurses the compiler complains that headers for ncurses have already been imported.  The solution (found here https://stackoverflow.com/questions/56251835/swift-package-manager-unable-to-compile-ncurses-installed-through-homebrew) is to do the following:
1. copy all headers from the homebrew keg
    ```bash
    cp -r /usr/local/Cellar/ncurses/6.1/include Sources/Cncurses/include
    ```
    Replace all occurrences of __NCURSES_H with __CNCURSES_H 
2. `find . -name '*.h' -exec sed -i ''  's/__NCURSES_H/__CNCURSES_H/g' {} \;`
    `h' -exec sed -i '' -E -e "s/<(.*(`find . -name '*.h' -exec basename {} \; |  paste -sd "|" -`))>/\"\1\"/g"  {} \;`
    
3.  Tell the compiler to ignore the headers provided by MacOS -Xcc -D__NCURSES_H

This still leads to a downstream problem of subsequent packages/ executables  having to pass the same compiler directive to get things to run though...need a better fix

// related post https://github.com/ardagnir/athame/issues/53
    __sighandler_t (on Linux) is not available on MacOS.
    A compiler directive was added in Curses.swift changing to the type alias to sig_t

### subwindows
Subwindows (methods such as subwin, derwin, mvderwin, wsyncup,  wsyncdown,
    wcursyncup,  syncok) are reported to be unstable per the man pages and as such are not implemented.  Additionally, they add another level of complexity for the user beyond the current scope of the project.
    
#### color table
https://www.ditig.com/256-colors-cheat-sheet
