#include "binary_search.h"

const int *binary_search(int value, const int *arr, size_t length) {
    int mid_index = length / 2;
    while (length > 1) {
        if (arr[mid_index] == value) return &arr[mid_index];

        if (arr[mid_index] > value) {
            length = mid_index;
            mid_index /= 2;
        } else {
            arr = &arr[mid_index];
            length -= mid_index;
        }
    }
    return (length < 1 || arr[0] != value) ? NULL : &arr[0];
}