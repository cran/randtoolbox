#############################################################################
#   Copyright (c) 2008 Christophe Dutang                                    #
#                                                                           #
#   This program is free software; you can redistribute it and/or modify    #
#   it under the terms of the GNU General Public License as published by    #
#   the Free Software Foundation; either version 2 of the License, or       #
#   (at your option) any later version.                                     #
#                                                                           #
#   This program is distributed in the hope that it will be useful,         #
#   but WITHOUT ANY WARRANTY; without even the implied warranty of          #
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           #
#   GNU General Public License for more details.                            #
#                                                                           #
#   You should have received a copy of the GNU General Public License       #
#   along with this program; if not, write to the                           #
#   Free Software Foundation, Inc.,                                         #
#   59 Temple Place, Suite 330, Boston, MA 02111-1307, USA                  #
#                                                                           #
#############################################################################
### random toolbox package
###
###			'autoconf' config file 
### 

###
### the 3 following macros are NOT mine. see copyleft section to know author.
###

# ===========================================================================
#        http://autoconf-archive.cryp.to/ax_check_compiler_flags.html
# ===========================================================================
#
#
# COPYLEFT
#
#   Copyright (c) 2008 Steven G. Johnson <stevenj@alum.mit.edu>
#   Copyright (c) 2008 Matteo Frigo
#
#   This program is free software: you can redistribute it and/or modify it
#   under the terms of the GNU General Public License as published by the
#   Free Software Foundation, either version 3 of the License, or (at your
#   option) any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
#   Public License for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program. If not, see <http://www.gnu.org/licenses/>.
#

AC_DEFUN([AX_CHECK_COMPILER_FLAGS],
[AC_PREREQ(2.59) dnl for _AC_LANG_PREFIX
AC_MSG_CHECKING([whether _AC_LANG compiler accepts $1])
dnl Some hackery here since AC_CACHE_VAL can't handle a non-literal varname:
AS_LITERAL_IF([$1],
  [AC_CACHE_VAL(AS_TR_SH(ax_cv_[]_AC_LANG_ABBREV[]_flags_$1), [
      ax_save_FLAGS=$[]_AC_LANG_PREFIX[]FLAGS
      _AC_LANG_PREFIX[]FLAGS="$1"
      AC_COMPILE_IFELSE([AC_LANG_PROGRAM()],
        AS_TR_SH(ax_cv_[]_AC_LANG_ABBREV[]_flags_$1)=yes,
        AS_TR_SH(ax_cv_[]_AC_LANG_ABBREV[]_flags_$1)=no)
      _AC_LANG_PREFIX[]FLAGS=$ax_save_FLAGS])],
  [ax_save_FLAGS=$[]_AC_LANG_PREFIX[]FLAGS
   _AC_LANG_PREFIX[]FLAGS="$1"
   AC_COMPILE_IFELSE([AC_LANG_PROGRAM()],
     eval AS_TR_SH(ax_cv_[]_AC_LANG_ABBREV[]_flags_$1)=yes,
     eval AS_TR_SH(ax_cv_[]_AC_LANG_ABBREV[]_flags_$1)=no)
   _AC_LANG_PREFIX[]FLAGS=$ax_save_FLAGS])
eval ax_check_compiler_flags=$AS_TR_SH(ax_cv_[]_AC_LANG_ABBREV[]_flags_$1)
AC_MSG_RESULT($ax_check_compiler_flags)
if test "x$ax_check_compiler_flags" = xyes; then
        m4_default([$2], :)
else
        m4_default([$3], :)
fi
])dnl AX_CHECK_COMPILER_FLAGS



# ===========================================================================
#            http://autoconf-archive.cryp.to/ax_gcc_x86_cpuid.html
# ===========================================================================
#
#
# COPYLEFT
#
#   Copyright (c) 2008 Steven G. Johnson <stevenj@alum.mit.edu>
#   Copyright (c) 2008 Matteo Frigo
#
#   This program is free software: you can redistribute it and/or modify it
#   under the terms of the GNU General Public License as published by the
#   Free Software Foundation, either version 3 of the License, or (at your
#   option) any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
#   Public License for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program. If not, see <http://www.gnu.org/licenses/>.
#


AC_DEFUN([AX_GCC_X86_CPUID],
[AC_REQUIRE([AC_PROG_CC])
AC_LANG_PUSH([C])
AC_CACHE_CHECK(for x86 cpuid $1 output, ax_cv_gcc_x86_cpuid_$1,
 [AC_RUN_IFELSE([AC_LANG_PROGRAM([#include <stdio.h>], [
     int op = $1, eax, ebx, ecx, edx;
     FILE *f;
     /* 64-bit code is easy */
     if (sizeof(long) == 8) {
        __asm__("cpuid"
                : "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
                : "a" (op));
     } else {
        __asm__("pushl %%ebx    \n\t"
	        "cpuid          \n\t"
	        "movl %%ebx, %1 \n\t"
	        "popl %%ebx     \n\t"
                : "=a" (eax), "=r" (ebx), "=c" (ecx), "=d" (edx)
                : "a" (op));
     }
     f = fopen("conftest_cpuid", "w"); if (!f) return 1;
     fprintf(f, "%x:%x:%x:%x\n", eax, ebx, ecx, edx);
     fclose(f);
     return 0;
])],
     [ax_cv_gcc_x86_cpuid_$1=`cat conftest_cpuid`; rm -f conftest_cpuid],
     [ax_cv_gcc_x86_cpuid_$1=unknown; rm -f conftest_cpuid],
     [ax_cv_gcc_x86_cpuid_$1=unknown])])
AC_LANG_POP([C])
])



# ===========================================================================
#                 http://autoconf-archive.cryp.to/ax_ext.html
# ===========================================================================
#
#
# COPYLEFT
#
#   Copyright (c) 2008 Christophe Tournayre <turn3r@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AC_DEFUN([AX_EXT],
[
  #AC_REQUIRE([AX_GCC_X86_CPUID])

  AX_GCC_X86_CPUID(0x00000001)
  ecx=`echo $ax_cv_gcc_x86_cpuid_0x00000001 | cut -d ":" -f 3`
  edx=`echo $ax_cv_gcc_x86_cpuid_0x00000001 | cut -d ":" -f 4`


 AC_CACHE_CHECK([whether sse2 is supported], [ax_have_sse2_ext],
  [
    ax_have_sse2_ext=no
    if test "$((0x$edx>>26&0x01))" = 1; then
      ax_have_sse2_ext=yes
    fi
  ])

  if test "$ax_have_sse2_ext" = yes; then
    AC_DEFINE(HAVE_SSE2, , [Support SSE2 (Streaming SIMD Extensions 2) instructions])
    AX_CHECK_COMPILER_FLAGS(-msse2, SIMD_FLAGS="$SIMD_FLAGS -msse2", [])
  fi

  AC_SUBST(SIMD_FLAGS)
])


### 
### here begins my code 
### 


# initialize
AC_INIT([randtoolbox], 1.04, [christophe.dutang@ensimag.fr])

#check header (1st arg), preprocessor @DEFS@ (2nd arg) if found, nothing if not found (3rd arg) 
AC_CHECK_HEADER([sys/time.h], 
		[AC_DEFINE(HAVE_SYS_TIME_H,1,[manual check for time.h header. define to 1 if you know you have it.])])
AC_CHECK_HEADER([time.h], 
		[AC_DEFINE(HAVE_TIME_H,1,[manual check for sys/time.h header. define to 1 if you know you have it.])])
AC_CHECK_HEADER([windows.h],  
		[AC_DEFINE(HAVE_WINDOWS_H,1,
[manual check for windows.h header. define to 1 if you know you have it. NB: you may not have both sys/time.h and windows.h headers.])])

AC_CHECK_HEADER([inttypes.h], 
		[AC_DEFINE(HAVE_INTTYPES_H,1,[manual check for inttypes.h header. define to 1 if you know you have it.])])

AC_CHECK_HEADER([stdint.h], 
		[AC_DEFINE(HAVE_STDINT_H,1,[manual check for stdint.h header. define to 1 if you know you have it.])])

#no support of ALTIVEC, simply not define it
#AC_DEFINE(HAVE_ALTIVEC,0,[no support of ALTIVEC.])

#check sse2 support
# http://softwarecommunity.intel.com/articles/eng/2978.htm
AX_EXT()

AC_CONFIG_HEADER([src/config.h])
AC_OUTPUT

### many ideas taken from configure.ac file of package foreign
### and gnu doc 
### http://www.gnu.org/software/autoconf/manual/autoconf-2.57/html_node/autoconf.html
### http://www.gnu.org/software/autoconf/manual/html_node/Autoconf-Language.html
###
### to check the config file, use in this order the 3 following command in the top directory
### >autoheader
### >autoconf
### >configure
### and open src/config.h



