enum Days { sunday, monday, tuesday, wednesday, thursday, friday, saturday }

void main() {
  Days today = Days.monday;

  switch (today) {
    case Days.sunday:
      print("its sunday");
      break;

    case Days.monday:
      print("its monday");
      break;

    case Days.tuesday:
      print("its tuesday");
      break;
    case Days.wednesday:
      print("its wednesday");
      break;

    case Days.thursday:
      print("its thursday");
      break;

    case Days.friday:
      print("its friday");
      break;

    case Days.saturday:
      print("its saturday");
      break;
  }
}
