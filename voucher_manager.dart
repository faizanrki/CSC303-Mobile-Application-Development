class VoucherManager {
  Set<String> vouchers = {
    "WELCOME10",
    "CAMPUS50",
    "EXAMBOOST",
  };

  double applyVoucher(String code, double amount) {
    if (vouchers.contains(code)) {
      double discount = 0.0;

      if (code == "WELCOME10") {
        discount = amount * 0.10;
      } else if (code == "CAMPUS50") {
        discount = 50.0;
      } else if (code == "EXAMBOOST") {
        discount = 75.0;
      }

      vouchers.remove(code);

      print("$code voucher applied.");

      return discount;
    } else {
      print("Invalid or already used voucher.");

      return 0.0;
    }
  }
}