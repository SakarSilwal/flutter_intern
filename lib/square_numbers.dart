void main() {
  // List of numbers
  List<int> numbers = [1, 2, 3, 4, 5];

  List<int> squaredUsingForEach = [];
  numbers.forEach((number) {
    squaredUsingForEach.add(number * number);
  });

  print('Squared using forEach: $squaredUsingForEach');

  List<int> squaredUsingMap = numbers.map((number) => number * number).toList();

  print('Squared using map(): $squaredUsingMap');
}
