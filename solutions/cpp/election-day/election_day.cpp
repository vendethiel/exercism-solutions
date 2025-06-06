#include <string>
#include <vector>

namespace election {

// The election result struct is already created for you:

struct ElectionResult {
    // Name of the candidate
    std::string name{};
    // Number of votes the candidate has
    int votes{};
};

int vote_count(ElectionResult const& e) {
    return e.votes;
}

void increment_vote_count(ElectionResult& e, int i) {
    e.votes += i;
}

ElectionResult& determine_result(std::vector<ElectionResult>& rs) {
    ElectionResult *best = nullptr;
    for (auto& r : rs) {
        if (best == nullptr || r.votes > best->votes)
            best = &r;
    }
    best->name = "President " + best->name;
    return *best;
}

}  // namespace election