

void main() {
  List<int> x = [1, 2, 3, 4, 5];

//  print(x[0]);
//  print("===========");

//  for (int i in x) {
//    print(i);
//  }
//  print("===========");

//  for (int i = 0; i < x.length; i++) {
//    print(x[i]);
//  }
//  print("===========");

//  x.forEach(
//      (n) => print(n)
//  );
//  print("===========");

  var numbers = Iterable.generate(10, (i) => i);
//  for (var n in numbers) {
//    print(n);
//  }
//  print(numbers.first);
//  print(numbers.last);
  print("===========");

  // skip first 4 values
//  print(numbers.skip(4).toList());

  // Take values until 5
//  print(
//    numbers.takeWhile(
//      (n) => n < 5,
//    )
//    .toList()
//  );

  // Take only 5 first values
//  print(numbers.take(5).toList());

  var list = numbers.toList();
  var s = numbers.toSet();
  var str = numbers.toString();
  print(str);
}