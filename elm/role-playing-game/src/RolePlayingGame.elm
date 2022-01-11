module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
        Just n -> n
        Nothing -> "Mighty Magician"


revive : Player -> Maybe Player
revive player =
    case player.health of
        0 ->
            if player.level >= 10 then
                Just {player | health = 100, mana = Just 100}
            else
                Just {player | health = 100, mana = Nothing}
        _ -> Nothing


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Just m ->
            if manaCost <= m then
                ( {player | mana = Just (m - manaCost)}, 2 * manaCost )
            else
                (player, 0)
        Nothing ->
            case (player.health - manaCost >= 0) of
                True ->  ( {player | health = player.health - manaCost}, 0 )
                False -> ( {player | health = 0}, 0 )

