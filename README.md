fSort
=========


About
----------
This is a utility script I made to ease out sorting different files (particulary art...)
into a sorted directory.

It'll iterate to a file and give you options on how you want to change it

Dependencies
------------
luafilesystem

Usage
------------
* `--input [ARGS...]`   : Select what files you want to sort out; if no file exists then it'll error
* `--tdir [ARG]`        : The target directory you want to sort to, ( if none exist then it'll create a new one )
* `--open [ARG]`        : It'll open the file with a specified program if you specify to open it
* `--help`              : Print this usage tab but for command line.
Once arguments are given it will prompt
```
[ <FILENAME> ] [ View y, n? ] <answer> ; Once exited it'll return to the next line
[ <FILENAME> ] [ Move to? ] <answer> ; If the directory doesn't exist it'll make one
[ <FILENAME> ] [ File mode ] <answer> ; leave blank and file mode will stay the same
