import 'dart:io';

void main() {
  stdout.write('enter the number you want table of:');
  int number = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= 10; i++) {
    stdout.write('\n$number x $i = ${number * i}');
  }
}
