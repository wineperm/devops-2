#1.#chdir("/tmp")                           = 0
#2./usr/share/misc/magic.mgc
#3.ne znau
#4.net
#5.strace -t /usr/sbin/opensnoop-bpfcc 2>&1 | grep openat 1> opensnoop     v file opensnoop otvet
#6.execve("/usr/bin/uname", ["uname", "-a"], 0x7fff06323008 /* 54 vars */) = 0
#	uname({sysname="Linux", nodename="virtual-machine", ...}) = 0
#	uname({sysname="Linux", nodename="virtual-machine", ...}) = 0
#	uname({sysname="Linux", nodename="virtual-machine", ...}) = 0
#	/proc/config.gz (since Linux 2.6)
#              This  file  exposes the configuration options that were used to build the currently
#              running kernel, in the same format as they would be shown in the .config file  that
#              resulted when configuring the kernel (using make xconfig, make config, or similar).
#              The file contents are compressed; view or search them using zcat(1)  and  zgrep(1).
#              As  long  as  no  changes  have  been  made  to the following file, the contents of
#              /proc/config.gz are the same as those provided by:
#
#                  cat /lib/modules/$(uname -r)/build/.config
#
#              /proc/config.gz is provided only if the kernel  is  configured  with  CONFIG_IKCON‐
#              FIG_PROC.
#	/proc/version
#              This string identifies the kernel version that is currently running.   It  includes
#              the    contents   of   /proc/sys/kernel/ostype,   /proc/sys/kernel/osrelease,   and
#              /proc/sys/kernel/version.  For example:
#
#                  Linux version 1.0.9 (quinlan@phaze) #1 Sat May 14 01:51:54 EDT 1994
#7.&& Оператор выполнит вторую команду только в том случае, если команда 1 успешно выполнена.
#  ; Оператор точка с запятой выполняет несколько команд одновременно последовательно, и обеспечивает вывод без зависимости от успеха и отказа других команд
#  set -e  Exit immediately if a command exits with a non-zero status.
#8.-e  Exit immediately if a command exits with a non-zero status.
#-f  Disable file name generation (globbing).
#-x  Print commands and their arguments as they are executed.
#-o option-name
#pipefail     the return value of a pipeline is the status of
#                           the last command to exit with a non-zero status,
#                           or zero if no command exited with a non-zero status
#9. ps -eo stat | grep -v STAT | sort | uniq -c | sort -nr
#PROCESS STATE CODES
#       Here are the different values that the s, stat and state output specifiers (header "STAT"
#       or "S") will display to describe the state of a process:
#
#               D    uninterruptible sleep (usually IO)
#               I    Idle kernel thread
#               R    running or runnable (on run queue)
#               S    interruptible sleep (waiting for an event to complete)
#               T    stopped by job control signal
#               t    stopped by debugger during the tracing
#               W    paging (not valid since the 2.6.xx kernel)
#               X    dead (should never be seen)
#               Z    defunct ("zombie") process, terminated but not reaped by its parent
#
#       For BSD formats and when the stat keyword is used, additional characters may be displayed:
#
#               <    high-priority (not nice to other users)
#               N    low-priority (nice to other users)
#               L    has pages locked into memory (for real-time and custom IO)
#               s    is a session leader
#               l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)
#               +    is in the foreground process group

