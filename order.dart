class Order {
  List<String> items = [];

  void addItem(String itemName) {
    items.add(itemName);
    print("$itemName added to order.");
  }

  void removeItem(String itemName) {
    if (items.contains(itemName)) {
      items.remove(itemName);
      print("$itemName removed from order.");
    } else {
      print("$itemName is not in the order.");
    }
  }

  void showOrder() {
    print("\n----- Your Order -----");

    for (String item in items) {
      print(item);
    }
  }
}