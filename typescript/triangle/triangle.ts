export class Triangle {

  a: number;
  b: number;
  c: number;

  constructor(...sides: number[]) {
    this.a = sides[0];
    this.b = sides[1];
    this.c = sides[2];
  }

  get isEquilateral() {
    return this.isTriangle() && this.a == this.b && this.b == this.c;
  }

  get isIsosceles() {
    return this.isTriangle() &&
        (this.a == this.b || this.b == this.c || this.a == this.c);
  }

  get isScalene() {
    return this.isTriangle() && !(this.isEquilateral || this.isIsosceles);
  }

  isTriangle() {
    return this.a + this.b > this.c &&
        this.b + this.c > this.a &&
        this.a + this.c > this.b;
  }
}

