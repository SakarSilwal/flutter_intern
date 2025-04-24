
void main() async{
 
  print("Line 1");
  await display();
  print("line 3"); 
  
}

 Future<void> display()async{
  Future.delayed(Duration(seconds:5), ()=>print("line 2"));
}