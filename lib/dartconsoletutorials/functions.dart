int add(int x, int y) => x + y;
int sub(int x, int y) => x - y;

choose(bool op) {
  if (op == true) {
    return add;
  } else {
    return sub;
  }
}

List operators = [add, sub];

// Closure sample
calc(int b) {
  int c = 1;
  return () => print("The value is ${b + c++}");
}

void main() {
  // Test 1
  //  var result = choose(true);
  //  print('Result is ${result(40, 50)}');

  // Test 2
  //  var result = choose(false)(10, 20);
  //  print('Result is ${result}');

  // Test 3
  //  var result = operators[1](10, 20);
  //  print("Result is ${result}");

  // Test closure
  var f = calc(10);
  f();
  // another instance of anonymous function
  calc(10)();
  // !!!!!  Here c variable will be incremented
  f();
  f();
  // anonymous function
  (a, b) {
    print("Hello, from CLosure: ${a + b}");
  }(10, 20);
}