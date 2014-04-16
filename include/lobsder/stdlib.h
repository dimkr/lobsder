#ifndef _LOBSDER_STDLIB_H_INCLUDED
#	define _LOBSDER_STDLIB_H_INCLUDED

#	include_next <stdlib.h>
#	include <sys/types.h> /* u_int32_t */
#	include <unistd.h>
#	include <linux/sysctl.h> /* sysctl() */

u_int32_t arc4random(void);

#endif
