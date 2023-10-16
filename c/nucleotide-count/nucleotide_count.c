#include "nucleotide_count.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

char *count(const char *dna_strand) {
    int A = 0;
    int C = 0;
    int G = 0;
    int T = 0;
    size_t strand_length = strlen(dna_strand);
    char *result = (char *) malloc(25);

    for (size_t i = 0; i < strand_length; i++) {
        char base = dna_strand[i];
        switch (base) {
            case 'A' :
                A++;
                break;
            case 'C' :
                C++; break;
            case 'G' :
                G++;
                break;
            case 'T' :
                T++;
                break;
            default :
                result[0] = '\0';
                return result;
        }
    }
    sprintf(result, "A:%d C:%d G:%d T:%d", A, C, G, T);
    return result;
}