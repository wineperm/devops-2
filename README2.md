#1. 1.1 18 # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#     	19 HISTSIZE=1000
#     	20 HISTFILESIZE=2000
#   1.2 HISTCONTROL
#       A colon-separated list of values controlling how commands are saved on the history list.  If the list of values includes  ignorespace,  lines  which
#       begin  with  a  space character are not saved in the history list.  A value of ignoredups causes lines matching the previous history entry to not be
#       saved.  A value of ignoreboth is shorthand for ignorespace and ignoredups.  A value of erasedups causes all previous lines matching the current line
#       to  be  removed  from the history list before that line is saved.  Any value not in the above list is ignored.  If HISTCONTROL is unset, or does not
#       include a valid value, all lines read by the shell parser are saved on the history list, subject to the value of HISTIGNORE.  The second and  subse‐
#       quent lines of a multi-line compound command are not tested, and are added to the history regardless of the value of HISTCONTROL.  
#   1.3 152 RESERVED WORDS
#   	153        Reserved  words are words that have a special meaning to the shell.  The following words are recognized as reserved when unquoted and either the first w    153 ord
#   	154        of a command (see SHELL GRAMMAR below), the third word of a case or select command (only in is valid), or the third word of a for command (only in  and     154  do
#   	155        are valid):
#   	156 
#   	157        ! case  coproc  do done elif else esac fi for function if in select then until while { } time [[ ]]
#
#
#
#
#
#
#
#
#
#
#
#
