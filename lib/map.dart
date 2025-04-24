void main() {
  Map<String, int> studentMarks = {
    'Sakar': 86,
    'ram': 90,
    'shyam': 78,
    'sita': 92,
    'gita': 48,
  };

  print('Student Marks:');
  studentMarks.forEach((name, mark) {
    print('$name: $mark');
  });
}
