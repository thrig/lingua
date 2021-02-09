/* setevexe - calculate lojban SE cmavo slot switcharoos,
 *
 *   "It is grammatical to convert a selbri more than once with SE;
 *   later (inner) conversions are applied before earlier (outer) ones."
 *     -- CLL 9.4
 */

#include <err.h>
#include <stdio.h>
#include <stdlib.h>
#include <sysexits.h>
#include <unistd.h>

// xlali, in multiple ways :)
#define XLALI(x)                                                               \
    do {                                                                       \
        fprintf(stderr, "invalid SE cmavo '%s'\n", x);                         \
        emit_help();                                                           \
    } while (0)

void emit_help(void);

int slots[5] = {1, 2, 3, 4, 5};

int main(int argc, char *argv[]) {
#ifdef __OpenBSD__
    if (pledge("stdio", NULL) == -1) err(1, "pledge failed");
#endif
    if (argc < 2) emit_help();
    int tmp;
    while (--argc > 0) {
        if (argv[argc][1] != 'e' || argv[argc][2] != '\0') XLALI(argv[argc]);
        switch (argv[argc][0]) {
        case 's':
            tmp      = slots[0];
            slots[0] = slots[1];
            slots[1] = tmp;
            break;
        case 't':
            tmp      = slots[0];
            slots[0] = slots[2];
            slots[2] = tmp;
            break;
        case 'v':
            tmp      = slots[0];
            slots[0] = slots[3];
            slots[3] = tmp;
            break;
        case 'x':
            tmp      = slots[0];
            slots[0] = slots[4];
            slots[4] = tmp;
            break;
        default: XLALI(argv[argc]);
        }
    }
    int i = 0;
    for (; i < 4; i++)
        printf("x%d ", slots[i]);
    printf("x%d\n", slots[i]);
    exit(EXIT_SUCCESS);
}

void emit_help(void) {
    fputs("Usage: setevexe se|te|ve|xe ...\n", stderr);
    exit(EX_USAGE);
}

/* WARNING use of this program for actual conversation may result in
 *
 *   do ba zi se te ve se te ve se te ve se te ve darxi mi
 */
