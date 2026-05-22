steps = (n) ->
  if n <= 0 error "Only positive integers are allowed"

  steps = 0
  while n ~= 1
      steps += 1
      n = if n % 2 == 0 then n / 2 else 3 * n + 1
  steps

{ :steps }
