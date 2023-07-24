#include "allergies.h"

namespace allergies {

    allergy_test::allergy_test(unsigned int n) : score(n){}
    bool allergy_test::is_allergic_to(std::string const& allergen) const {
        return (score & ITEMS.at(allergen)) > 0;
    }

    std::unordered_set<std::string> allergy_test::get_allergies() const {
        std::unordered_set<std::string> allergies;

        for (auto const& allergen : allergies::ITEMS) {
            if ((score & allergen.second) == allergen.second)
                allergies.insert(allergen.first);
        }
        return allergies;
    }
}  // namespace allergies
