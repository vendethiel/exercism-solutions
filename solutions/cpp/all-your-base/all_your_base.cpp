#include "all_your_base.h"

#include <cmath>
#include <vector>
#include <algorithm>
#include <stdexcept>

namespace all_your_base {
    std::vector<unsigned int> convert(unsigned int from, std::vector<unsigned int> const & in, unsigned int to) {
        if (from <= 1 || to <= 1) {
            throw std::invalid_argument("oh no");
        }
        std::vector<unsigned int> ret;
        unsigned int cur = 0;
        std::size_t size = in.size();
        for (std::size_t i = 0; i < size; ++i) {
            if (in[i] >= from) {
                throw std::invalid_argument("oh no");
            }
            const std::size_t diff = size - 1 - i;
            cur += in[i] * std::pow(from, diff);
        }
        while (cur > 0) {
            ret.push_back(cur % to);
            cur /= to;
        }
        std::reverse(ret.begin(), ret.end());
        return ret;
    }
}  // namespace all_your_base
