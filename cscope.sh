#!/bin/bash

find `pwd` -name "*.cpp"-o -name "*.cxx" -o -name "*.cc" -o -name "*.h" -o -name "*.c" -o -name "*.hpp" -o -name "*.hxx" > cscope.files
cscope -bkq -i cscope.files
ctags -R

