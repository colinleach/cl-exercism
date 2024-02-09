handshake <- function(n) {
  if (n %% 16 == 0) return(c())
  
  responses  <- c('wink', 'double blink', 'close your eyes', 'jump')
  actions <- responses[bitwAnd(2^(0:3), n) != 0]
  if (bitwAnd(2^4, n) == 0) actions
  else rev(actions)
}
