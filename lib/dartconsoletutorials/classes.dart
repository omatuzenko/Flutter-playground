class Complex {

  // num _real; - if you want to make it private

  num real;

  num imaginary;

  num _privateValue;

  get privateValue => _privateValue;
  set privateValue(num value) => _privateValue = value;

  Complex(this.real, this.imaginary);

  // Named constructor using initializer : operator required to use 'this' keyword
  Complex.real(num real) : this(real, 0);

  // Named constructor using initializer :
  Complex.imaginary(num imaginary) : this(0, imaginary);

  @override
  String toString() {
    if (imaginary >= 0) {
      return "$real + ${imaginary}i";
    } else {
      return "$real - ${imaginary.abs()}i";
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Complex &&
              runtimeType == other.runtimeType &&
              real == other.real &&
              imaginary == other.imaginary;

  @override
  int get hashCode =>
      real.hashCode ^
      imaginary.hashCode;
}

void main() {
  // normal instantiation
//  var c = Complex();
//  c.real = 2;
//  c.imaginary = 5;
//  print(c);

  // Cascading instantiation
//  var c2 = Complex()
//    ..real = 1
//    ..imaginary = -10;
//  print(c2);

  // Constructors
  print(Complex(10, 15));
  print(Complex.real(20));
  print(Complex.imaginary(30));

  // Getter setter
  var c = Complex(10, 15);
  c.privateValue = 35;
  print(c.privateValue);
}