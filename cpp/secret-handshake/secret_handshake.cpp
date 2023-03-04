#include "secret_handshake.h"

namespace secret_handshake {

vector<string> commands(unsigned int num) {
    const unsigned int wink = 0b00001;
    const unsigned int dblink = 0b00010;
    const unsigned int close = 0b00100;
    const unsigned int jump = 0b01000;
    const unsigned int rev = 0b10000;
    vector<string> resp;

    if (num & wink) resp.push_back("wink");
    if (num & dblink) resp.push_back("double blink");
    if (num & close) resp.push_back("close your eyes");
    if (num & jump) resp.push_back("jump");
    if (num & rev) reverse(resp.begin(), resp.end());
    return resp;
}

}  // namespace secret_handshake
