#include "sieve.h"

namespace sieve {
    vector<int> primes(const int limit) {
        vector<int> nums(limit + 1);
        vector<int> result;

        for (int i=2; i <= limit; i++) nums[i] = i;
        int unmarked = 2;

//      mark non-primes by setting them to 0
        while (unmarked <= limit) {
            for (int i = unmarked; i * unmarked <= limit; i++) nums[i * unmarked] = 0;
            do {
                unmarked++;
            } while (unmarked<=limit && nums[unmarked]==0) ;
        }

//      copy primes to an output vector
        for (int i=2; i <= limit; i++) {
            if (nums[i] != 0) result.push_back(nums[i]);
        }
        return result;
    }
}  // namespace sieve
