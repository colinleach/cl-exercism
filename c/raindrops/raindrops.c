#include "raindrops.h"

void convert(char result[], int drops) {
    char *pling = drops % 3 == 0 ? "Pling" : "";
    char *plang = drops % 5 == 0 ? "Plang" : "";
    char *plong = drops % 7 == 0 ? "Plong" : "";
    sprintf(result, "%s%s%s", pling, plang, plong);
    if (strlen(result) == 0) sprintf(result, "%d", drops);
}
