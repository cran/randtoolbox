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


# initialize
AC_INIT([randtoolbox], 1.02, [christophe.dutang@ensimag.fr])

#check header (1st arg), preprocessor @DEFS@ (2nd arg) if found, nothing if not found (3rd arg) 
AC_CHECK_HEADER([sys/time.h], 
		[AC_DEFINE(HAVE_SYS_TIME_H,1,[manual check for time.h header. define to 1 if you know you have it.])])
AC_CHECK_HEADER([time.h], 
		[AC_DEFINE(HAVE_TIME_H,1,[manual check for sys/time.h header. define to 1 if you know you have it.])])
AC_CHECK_HEADER([windows.h],  
		[AC_DEFINE(HAVE_WINDOWS_H,1,
[manual check for windows.h header. define to 1 if you know you have it. NB: you may not have both sys/time.h and windows.h headers.])])

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