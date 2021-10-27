#############################################################################
#   Copyright (c) 2021 Christophe Dutang                                    #
#                                                                           #
#   Redistribution and use in source and binary forms, with or without      #
#   modification, are permitted provided that the following conditions      #
#   are met:                                                                #
#   1. Redistributions of source code must retain the above copyright       #
#     notice, this list of conditions and the following disclaimer.         #
#   2. Redistributions in binary form must reproduce the above copyright    #
#     notice, this list of conditions and the following disclaimer in the   #
#     documentation and/or other materials provided with the distribution.  #
#   3. Neither the name of the copyright holder nor the names of its        #
#     contributors may be used to endorse or promote products derived       # 
#     from this software without specific prior written permission.         #
#                                                                           #  
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     #
#   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       #
#   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       #
#   FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE          #
#   COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,    #
#   INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,    #
#   BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;        #
#   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER        #
#   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT      #
#   LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN       #
#   ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         #
#   POSSIBILITY OF SUCH DAMAGE.                                             #
#                                                                           #
#############################################################################
### random toolbox package
###
###			'autoconf' config file 
### 

###
### the 3 following macros are __NOT__ mine. see copyleft section to know the
### author, we remove obsolete commands: 
### - AC_FD_MSG see change by autoupdate to AS_MESSAGE_FD, 
### - AC_TRY_COMPILE see https://www.gnu.org/software/autoconf/manual/autoconf-2.70/html_node/Obsolete-Macros.html, 
### - AC_CONFIG_HEADER see https://www.gnu.org/software/autoconf/manual/autoconf-2.70/html_node/Configuration-Headers.html#index-AC_005fCONFIG_005fHEADERS
### We add some commands 
### - AC_LANG_SOURCE, 
### - AC_LANG_PROGRAM, see https://lists.gnu.org/archive/html/bug-autoconf/2010-09/msg00092.html.
### - AC_LANG_CONFTEST, see https://www.gnu.org/software/autoconf/manual/autoconf-2.63/html_node/Generating-Sources.html 
### Help at https://www.gnu.org/software/autoconf/manual/
### good examples also in RODBC and RDieHarder packages

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
      [AC_RUN_IFELSE(
        AC_LANG_CONFTEST(
          [AC_LANG_PROGRAM(
            [#include <stdio.h>], 
            [int op = $1, eax, ebx, ecx, edx;
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
            ])
          ]),
        [ax_cv_gcc_x86_cpuid_$1=`cat conftest_cpuid`; rm -f conftest_cpuid],
        [ax_cv_gcc_x86_cpuid_$1=unknown; rm -f conftest_cpuid],
        [ax_cv_gcc_x86_cpuid_$1=unknown])
      ]
    )
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


# ===========================================================================
#                 http://autoconf-archive.cryp.to/ac_c_bigendian_cross.html
# ===========================================================================
#
#
#	License
#	Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
#
#	This program is free software; you can redistribute it and/or modify 
#	it under the terms of the GNU General Public License as published by 
#	the Free Software Foundation; either version 2 of the License, or 
#	(at your option) any later version.
#
#	This program is distributed in the hope that it will be useful, but 
#	WITHOUT ANY WARRANTY; without even the implied warranty of 
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
#	General Public License for more details.
#
#	You should have received a copy of the GNU General Public License 
#	along with this program. If not, see <http://www.gnu.org/licenses/>.
#
#	As a special exception, the respective Autoconf Macro's copyright 
#	owner gives unlimited permission to copy, distribute and modify the 
#	configure scripts that are the output of Autoconf when processing the 
#	Macro. You need not follow the terms of the GNU General Public License 
#	when using or distributing such scripts, even though portions of the 
#	text of the Macro appear in them. The GNU General Public License (GPL) 
#	does govern all other use of the material that constitutes the 
#	Autoconf Macro.
#
#	This special exception to the GPL applies to versions of the Autoconf 
#	Macro released by the Autoconf Macro Archive. When you make and 
#	distribute a modified version of the Autoconf Macro, you may extend 
#	this special exception to the GPL to apply to your modified version 
#	as well.
#

AC_DEFUN(
  [AC_C_BIGENDIAN_CROSS],
  [AC_CACHE_CHECK(whether byte ordering is bigendian, ac_cv_c_bigendian,
    [ac_cv_c_bigendian=unknown
    # See if sys/param.h defines the BYTE_ORDER macro.
    AC_COMPILE_IFELSE(
      [AC_LANG_PROGRAM(
        [[#include <sys/types.h>
        #include <sys/param.h>]], [[
        #if !BYTE_ORDER || !BIG_ENDIAN || !LITTLE_ENDIAN
        bogus endian macros
        #endif]])
      ],
      [# It does; now see whether it defined to BIG_ENDIAN or not.
        AC_COMPILE_IFELSE(
          [AC_LANG_PROGRAM(
            [[#include <sys/types.h>
            #include <sys/param.h>]], [[
            #if BYTE_ORDER != BIG_ENDIAN
            not big endian
            #endif]])
          ], ac_cv_c_bigendian=yes, ac_cv_c_bigendian=no)
      ],[])
    if test $ac_cv_c_bigendian = unknown; then
      AC_RUN_IFELSE(
        [AC_LANG_PROGRAM(
          [],
          [[{
          /* Are we little or big endian?  From Harbison&Steele.  */
          union
          {
            long l;
            char c[sizeof (long)];
          } u;
          u.l = 1;
          exit (u.c[sizeof (long) - 1] == 1);
          }]])
        ],
        [ac_cv_c_bigendian=no],
        [ac_cv_c_bigendian=yes],
        [ echo $ac_n "cross-compiling... " 2>&AS_MESSAGE_FD ]
      ) 
    fi
    ]
  )
  if test $ac_cv_c_bigendian = unknown; then
    AC_MSG_CHECKING(to probe for byte ordering)
    AC_LANG_CONFTEST([
      AC_LANG_SOURCE([
      cat >conftest.c <<EOF
      short ascii_mm[] = { 0x4249, 0x4765, 0x6E44, 0x6961, 0x6E53, 0x7953, 0 };
      short ascii_ii[] = { 0x694C, 0x5454, 0x656C, 0x6E45, 0x6944, 0x6E61, 0 };
      void _ascii() { char* s = (char*) ascii_mm; s = (char*) ascii_ii; }
      short ebcdic_ii[] = { 0x89D3, 0xE3E3, 0x8593, 0x95C5, 0x89C4, 0x9581, 0 };
      short ebcdic_mm[] = { 0xC2C9, 0xC785, 0x95C4, 0x8981, 0x95E2, 0xA8E2, 0 };
      void _ebcdic() { char* s = (char*) ebcdic_mm; s = (char*) ebcdic_ii; }
      int main() { _ascii (); _ebcdic (); return 0; }
      EOF
      ]) 
    ]) 
    if test -f conftest.c ; then
     if ${CC-cc} -c conftest.c -o conftest.o && test -f conftest.o ; then
      if test `grep -l BIGenDianSyS conftest.o` ; then
         echo $ac_n ' big endian probe OK, ' 1>&AS_MESSAGE_FD
         ac_cv_c_bigendian=yes
      fi
      if test `grep -l LiTTleEnDian conftest.o` ; then
         echo $ac_n ' little endian probe OK, ' 1>&AS_MESSAGE_FD
         if test $ac_cv_c_bigendian = yes ; then
          ac_cv_c_bigendian=unknown;
         else
          ac_cv_c_bigendian=no
         fi
      fi
      echo $ac_n 'guessing bigendian ...  ' >&AS_MESSAGE_FD
     fi
    fi
    AC_MSG_RESULT($ac_cv_c_bigendian)
  fi
  if test $ac_cv_c_bigendian = yes; then
    AC_DEFINE(WORDS_BIGENDIAN, 1, [whether byteorder is bigendian])
    BYTEORDER=4321
  else
    BYTEORDER=1234
  fi
  AC_DEFINE_UNQUOTED(BYTEORDER, $BYTEORDER, [1234 = LIL_ENDIAN, 4321 = BIGENDIAN])
  if test $ac_cv_c_bigendian = unknown; then
    AC_MSG_ERROR(unknown endianess - sorry, please pre-set ac_cv_c_bigendian)
  fi
])



### 
### here begins my code 
### 


### initialize
AC_INIT([randtoolbox], 1.31.0, [christophe.dutang@ensimag.fr])

### check header (1st arg), preprocessor @DEFS@ (2nd arg) if found, nothing if not found (3rd arg) 
AC_CHECK_HEADER([sys/time.h], 
		[AC_DEFINE(HAVE_SYS_TIME_H,1,[manual check for sys/time.h header. define to 1 if you know you have it.])])
AC_CHECK_HEADER([time.h], 
		[AC_DEFINE(HAVE_TIME_H,1,[manual check for time.h header. define to 1 if you know you have it.])])
AC_CHECK_HEADER([windows.h],  
		[AC_DEFINE(HAVE_WINDOWS_H,1,
[manual check for windows.h header. define to 1 if you know you have it. NB: you may not have both sys/time.h and windows.h headers.])])

AC_CHECK_HEADER([inttypes.h], 
		[AC_DEFINE(HAVE_INTTYPES_H,1,[manual check for inttypes.h header. define to 1 if you know you have it.])])


### check endianness
AC_C_BIGENDIAN_CROSS

### check sizeof of unsigned long long
AC_CHECK_SIZEOF(unsigned long long, 8)

### no support of ALTIVEC, simply not define it

### check sse2 support
### http://softwarecommunity.intel.com/articles/eng/2978.htm
#AX_EXT()

AC_CONFIG_HEADERS([src/config.h])
AC_OUTPUT

### many ideas taken from configure.ac file of package foreign
### and gnu doc 
### http://www.gnu.org/software/autoconf/manual/autoconf-2.57/html_node/autoconf.html
### http://www.gnu.org/software/autoconf/manual/html_node/Autoconf-Language.html
###
### to check the config file, use 
### >autoreconf --warnings=obsolete
### to make the config file, use in this order the 3 following command in the top directory
### >autoheader
### >autoconf
### >./configure
### and open src/config.h



