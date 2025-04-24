class Car {
  
  String brand;
  String model;
  int year;

  
  Car(this.brand, this.model, this.year);

  
  void displayDetails() {
    print("Brand: $brand");
    print("Model: $model");
    print("Year: $year");
  }
}

void main() {

  Car myCar = Car("Toyota", "Corolla", 2022);

  myCar.displayDetails();
}
