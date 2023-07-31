#if !defined(ALLERGIES_H)
#define ALLERGIES_H

#include <map>
#include <string>
#include <unordered_set>

namespace allergies {

    std::map<std::string, unsigned int> const ITEMS{
        {"eggs", 1},
        {"peanuts", 2},
        {"shellfish", 4},
        {"strawberries", 8},
        {"tomatoes", 16},
        {"chocolate", 32},
        {"pollen", 64},
        {"cats", 128}
    };

    class allergy_test {
    public:
        explicit allergy_test(unsigned int n);

        [[nodiscard]] bool is_allergic_to(std::string const& allergen) const;
        [[nodiscard]] std::unordered_set<std::string> get_allergies() const;

    private:
        unsigned int const score;
    };
}  // namespace allergies

#endif // ALLERGIES_H