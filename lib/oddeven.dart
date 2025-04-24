import 'dart:io';

void main() {
  stdout.write('enter a number to find odd or even:');
  int number = int.parse(stdin.readLineSync()!);

  if (number % 2 == 0) {
    stdout.write('the given number $number is even');
  } else {
    stdout.write('the given number $number is odd');
  }
}
