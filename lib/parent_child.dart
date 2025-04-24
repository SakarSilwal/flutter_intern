// Parent class
class Person {
  void sayHello() {
    print("Hello, I am a person.");
  }
}

class Student extends Person {
  void study() {
    print("I am studying.");
  }
}

void main() {
  Student s1 = Student();

  s1.sayHello();
  s1.study();
}
