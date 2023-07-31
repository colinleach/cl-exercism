export function clean(input: string): string {
  if (input.match(/[a-zA-Z]/g)) {
    throw new Error('Letters not permitted')
  }
  let digits = input.replaceAll(/[+()\- .]/g, '');
  if (input.match(/[!@#$%^&*?<>;:]/)) {
    throw new Error('Punctuations not permitted')
  }
  if (digits.length < 10) {
    throw new Error('Incorrect number of digits');
  }
  if (digits.length > 11) {
    throw new Error('More than 11 digits');
  }
  let l = digits.length;
  if (l === 11) {
    if (digits[0] === '1') {
      digits = digits.substring(1);
    } else {
      throw new Error('11 digits must start with 1');
    }
  }
  if (digits[0] === '0') {
    throw new Error('Area code cannot start with zero');
  }
  if (digits[0] === '1') {
    throw new Error('Area code cannot start with one');
  }
  if (digits[3] === '0') {
    throw new Error('Exchange code cannot start with zero');
  }
  if (digits[3] === '1') {
    throw new Error('Exchange code cannot start with one');
  }
  return digits;
}
