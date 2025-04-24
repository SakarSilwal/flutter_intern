import 'dart:io';


void main() {
  stdout.write('Enter first number (a): ');
  int a = int.parse(stdin.readLineSync()!);

  stdout.write('Enter second number (b): ');
  int b = int.parse(stdin.readLineSync()!);

  print('\nBefore swap a = $a, b = $b');

  // Swap without third variable
  a = a + b;
  b = a - b;
  a = a - b;

  print('After swap a = $a, b = $b');
}
