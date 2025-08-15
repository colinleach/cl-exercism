#include "rna_transcription.h"

char convert(char base) {
    switch (base) {
        case 'G': return 'C';
        case 'C': return 'G';
        case 'T': return 'A';
        case 'A': return 'U';
        default: return '\0';
    }
}

char *to_rna(const char *dna) {
    size_t length = strlen(dna);
    char* output = (char*)malloc(length + 1);
    if (output != NULL) {
        for (size_t i = 0; i < length; i++) {
            output[i] = convert(dna[i]);
        }
        output[length] = '\0';    
    }
    return output;
}
