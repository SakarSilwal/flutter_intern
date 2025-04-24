import 'dart:io';

int getMaximum(int a, int b) {
  if (a > b) {
    return a;
  } else {
    return b;
  }
}

void main() {
  stdout.write("Enter first number:");
  int a = int.parse(stdin.readLineSync()!);

   stdout.write("Enter second number:");
  int b = int.parse(stdin.readLineSync()!);

  int max = getMaximum(a, b);
   stdout.write("The maximum number is: $max");
}

