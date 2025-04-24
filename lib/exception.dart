void main() {
  int a = 10;
  int b = 0;

  try {
    print(a ~/ b); // Integer division
  } catch (e) {
    print('Cannot divide by zero.');
  }
}
