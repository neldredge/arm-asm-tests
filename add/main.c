#include <stdio.h>
#include <stdlib.h>

extern long add(long, long);

int main(int argc, char *argv[]) {
    if (argc < 3) {
	fprintf(stderr, "Usage: %s a b\n", argv[0]);
	exit(2);
    }
    long a = atol(argv[1]);
    long b = atol(argv[2]);
    long r = add(a,b);
    long check = a+b;
    int ok = (r == check);
    printf("%s: %ld + %ld = %ld (should be %ld)\n",
	   ok ? "OK" : "FAIL",
	   a, b, r, check);
    return ok ? 0 : 1;
}
