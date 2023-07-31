export class Anagram {

  input: string
  sortedInput: string

  constructor(input: string) {
    this.input = input
    this.sortedInput = input.toUpperCase().split('').sort().join()
  }

  public matches(...potentials: string[]): string[] {
    let goodMatches: string[] = []
    potentials.forEach(item => {
      if (this.isAnagram(item)) {
        goodMatches.push(item);
      }
    });
    return goodMatches;
  }

  isAnagram(test: string): boolean {
    if (test.length !== this.input.length ||
        test.toUpperCase() === this.input.toUpperCase()) {
      return false;
    }
    let letters = test.toUpperCase().split('').sort().join()
    return letters === this.sortedInput
  }
}
