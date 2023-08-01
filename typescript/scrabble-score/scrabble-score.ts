export function score(input: string) : number {
  if (input === undefined) {
    return 0;
  }
  let accum = 0;
  input.split('').forEach(letter => {
    accum += letterScore(letter);
  })
  return accum;
}

function letterScore(letter: string): number {
  let c = letter.toUpperCase();
  if (['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'].includes(c)) {
    return 1;
  }
  if (['D', 'G'].includes(c)) {
    return 2;
  }
  if (['B', 'C', 'M', 'P'].includes(c)) {
    return 3;
  }
  if (['F', 'H', 'V', 'W', 'Y'].includes(c)) {
    return 4;
  }
  if ('K' === c) {
    return 5;
  }
  if (['J', 'X'].includes(c)) {
    return 8;
  }
  if (['Q', 'Z'].includes(c)) {
    return 10;
  }
  return 0;
}
