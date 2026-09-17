class CanteenMenu {
  Map<String, double> menuItems = {
    "Chicken Roll": 250.0,
    "Zinger Burger": 450.0,
    "Fries": 180.0,
    "Coffee": 150.0,
    "Fresh Juice": 200.0,
  };

  void showMenu() {
    print("\n----- Canteen Menu -----");

    for (String item in menuItems.keys) {
      print("$item : Rs. ${menuItems[item]}");
    }
  }
}