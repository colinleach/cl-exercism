module TicketPlease exposing (..)

import TicketPleaseSupport exposing (Status(..), Ticket(..), User(..))


emptyComment : ( User, String ) -> Bool
emptyComment (_, comment) =
    comment == ""


numberOfCreatorComments : Ticket -> Int
numberOfCreatorComments ticket =
    


-- assignedToDevTeam : Ticket -> Bool
-- assignedToDevTeam =
--     Debug.todo "Please implement the function assignedToDevTeam"


-- assignTicketTo : User -> Ticket -> Ticket
-- assignTicketTo =
--     Debug.todo "Please implement the function assignTicketTo"
