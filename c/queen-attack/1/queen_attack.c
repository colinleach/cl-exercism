#include "queen_attack.h"
#include <stdlib.h>
#include <stdbool.h>

attack_status_t can_attack(position_t white_queen, position_t black_queen) {
    if (white_queen.row > 7 || black_queen.row > 7 ||
        white_queen.column > 7 || black_queen.column > 7 ||
        (white_queen.row == black_queen.row && white_queen.column == black_queen.column)
    ) return INVALID_POSITION;

    if (white_queen.row == black_queen.row ||
        white_queen.column == black_queen.column ||
        abs(white_queen.row - black_queen.row) == abs(white_queen.column - black_queen.column) 
    ) return CAN_ATTACK;
    
    return CAN_NOT_ATTACK;
}
