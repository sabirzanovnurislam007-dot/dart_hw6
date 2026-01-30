int totalCalls = 0;

void main() {
  greet();
  greet();
  greet();

  introduce("Nur", 25);
  introduce("Ali", 20);
  introduce("Bek", 30);

  int result = addNumbers(5, 8);
  print("Sum of 5 and 8 is $result");

  double p1 = calculateDiscount(price: 100);
  print("Final price: $p1");

  double p2 = calculateDiscount(price: 100, discount: 10);
  print("Final price: $p2");

  double p3 = calculateDiscount(price: 100, discount: 10, tax: 5);
  print("Final price: $p3");

  print("Total function calls: $totalCalls");
}

// greeting
void greet() {
  totalCalls = totalCalls + 1;
  print("Hello! Welcome to Dart programming!");
}

// introduce person
void introduce(String name, int age) {
  totalCalls = totalCalls + 1;
  print("My name is $name and I am $age years old.");
}

// add two numbers
int addNumbers(int a, int b) {
  totalCalls = totalCalls + 1;
  int sum = a + b;
  return sum;
}

// calculate final price
double calculateDiscount({
  required double price,
  double discount = 0,
  double tax = 0,
}) {
  totalCalls = totalCalls + 1;

  double finalPrice;
  finalPrice = price - (price * discount / 100);
  finalPrice = finalPrice + (price * tax / 100);

  return finalPrice;
}