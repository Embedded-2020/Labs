#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>

int main() {
	struct timeval Arxi;
	struct timeval Telos;

	gettimeofday(&Arxi, NULL);

	gettimeofday(&Telos, NULL);
	long int Resta =  Telos.tv_usec - Arxi.tv_usec;

	printf("%ld\n", resta);

	return 0;
}
