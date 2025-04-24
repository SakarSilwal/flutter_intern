import 'dart:io';

bool isLeapYear(int year) {
  // Leap year conditions
  if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
    return true;
  } else {
    return false;
  }
}

void main() {
  print("Enter a year:");
  int year = int.parse(stdin.readLineSync()!);
  bool result = isLeapYear(year);
  
  if (result) {
    print("$year is a leap year.");
  } else {
    print("$year is not a leap year.");
  }
}
