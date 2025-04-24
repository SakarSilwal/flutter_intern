void main() async {
  print("Start");

  await fetchData();

  print("End");

}

Future<void> fetchData() async {
  // Simulate delay like a server response
  await Future.delayed(Duration(seconds: 5));
  print("Data fetched from server");
}
