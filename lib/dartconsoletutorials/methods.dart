class Complex {

  // num _real; - if you want to make it private, same for methods

  num real;

  num imaginary;

  num _privateValue;

  // Static variable
  static num counter = 0;

  get privateValue => _privateValue;
  set privateValue(num value) => _privateValue = value;

  Complex(this.real, this.imaginary);

  // Private constructor
//  Complex._(this.real, this.imaginary);

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

  // Implement + functionality
  Complex operator +(Complex c) {
    return Complex(
      this.real + c.real,
      this.imaginary + c.imaginary
    );
  }

  // Create method
  Complex multiply(Complex c) {
    var first = this.real * c.real;
    var inner = this.imaginary * c.real;
    var outer = this.real * c.imaginary;
    var last = -(this.imaginary) * c.imaginary;
    return Complex(
        first + last,
        inner + outer
    );
  }

  // Static method
  static Complex subtract(Complex c1, Complex c2) {
    return Complex(
      c1.real - c2.real,
      c1.imaginary - c2.imaginary,
    );
  }
}

class ComplexSubclass extends Complex {
  num additionalPart;

  ComplexSubclass(
      num real,
      num imaginary,
      this.additionalPart,
  ) : super(
      real,
      imaginary,
  );
}

void main() {
  // Sum operator
  var c1 = Complex(3, -2);
  var c2 = Complex(1, 4);
  print(c1 + c2);
  print(c1.multiply(c2));
  print(Complex.subtract(c1, c2));
}