## enagdt.asm - line 7
(top to bottom = left to right)
 1 for a valid sector of memory;
 00(ring 0) highest priviledge available(01(ring 1) > 10(ring 2) > 11(ring 3));
 1 for code and data segments(0 for system segments);
 1 for executable (0 for not executable(for example data segments));
 0, direction bit idk what that is;
 1 for readable (0 for not readable);
 0, the cpu sets it to 1 once its accessed(access bit);
 b, makes all of the ones and zeros into a byte instead of some long number

## enagdt.asm - line 8
(top to bottom = left to right)
 1 for 4kib blocks, (0 for 1 byte blocks) (granularity);
 1 for 32-bit(0 for 16-bit) (size)
 00 doesn't mean anything
 (upper limit, 4 bytes, continues from the 0 in the same order)
 1111 for the biggest limit(extension of the previously declared limit);
 b, makes all of the ones and zeros into a byte instead of some long number

## g_desc
the final value that is passed to the cpu. contains the size of the gdt - 1, as requiered by the standard.