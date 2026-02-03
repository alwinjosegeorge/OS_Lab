#include <stdio.h>
#include <time.h>
#include <unistd.h>

int main(void) {
    time_t now;

    time(&now);
    printf("Current system time: %s", ctime(&now));

    sleep(300);

    return 0;
}

