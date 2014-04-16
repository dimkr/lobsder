#ifndef _LOBSDER_STRING_H_INCLUDED
#	define _LOBSDER_STRING_H_INCLUDED

#	include_next <string.h>

#	define strlcpy strncpy
#	define strlcat strncat

#endif
