class Student {
  String name;
  String studentId;
  double walletBalance;
  bool isHostelite;
  int loyaltyPoints;
  bool isAccountActive;

  Student(
    this.name,
    this.studentId,
    this.walletBalance,
    this.isHostelite,
    this.loyaltyPoints,
    this.isAccountActive,
  );

  void displayProfile() {
    print("----- Student Profile -----");
    print("Name: $name");
    print("Student ID: $studentId");
    print("Wallet Balance: Rs. $walletBalance");
    print("Hostelite: $isHostelite");
    print("Loyalty Points: $loyaltyPoints");
    print("Account Active: $isAccountActive");
  }

  bool canPlaceOrder() {
    if (isAccountActive == true && walletBalance > 0) {
      return true;
    } else {
      return false;
    }
  }

  bool hasEnoughBalance(double amount) {
    return walletBalance >= amount;
  }

  void deductBalance(double amount) {
    walletBalance = walletBalance - amount;
  }

  Map<String, dynamic> getProfileMap() {
    return {
      "Name": name,
      "Student ID": studentId,
      "Wallet Balance": walletBalance,
      "Hostelite": isHostelite,
      "Loyalty Points": loyaltyPoints,
    };
  }
}