#include "secret_handshake.h"

#include <algorithm>

namespace secret_handshake {
    std::vector<std::string> commands(int n) {
        std::vector<std::string> xs;
        if (n & 0b00001) xs.push_back("wink");
        if (n & 0b00010) xs.push_back("double blink");
        if (n & 0b00100) xs.push_back("close your eyes");
        if (n & 0b01000) xs.push_back("jump");
        if (n & 0b10000) std::reverse(xs.begin(), xs.end());
        return xs;
    }
}  // namespace secret_handshake
