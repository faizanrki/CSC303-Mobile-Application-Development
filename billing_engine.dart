import 'student.dart';
import 'order.dart';
import 'canteen_menu.dart';
import 'voucher_manager.dart';
import 'transaction_logger.dart';

class BillingEngine {
  double calculateTotal(
    List<String> orderItems,
    Map<String, double> menuPrices,
  ) {
    double total = 0.0;

    for (String item in orderItems) {
      total = total + (menuPrices[item] ?? 0.0);
    }

    return total;
  }

  double applyDiscount(
    double subtotal,
    bool isHostelite,
    int loyaltyPoints,
  ) {
    double finalAmount = subtotal;

    if (isHostelite == true && subtotal > 500) {
      finalAmount = finalAmount - (subtotal * 0.15);
    } else if (isHostelite == false && subtotal > 700) {
      finalAmount = finalAmount - (subtotal * 0.10);
    }

    if (loyaltyPoints > 100) {
      finalAmount = finalAmount - 50;
    }

    return finalAmount;
  }

  void checkout(
    Student student,
    Order order,
    CanteenMenu menu,
    VoucherManager voucherManager,
    TransactionLogger logger,
    String voucherCode,
  ) {
    double subtotal = calculateTotal(
      order.items,
      menu.menuItems,
    );

    // Separate discounts for receipt
    double studentDiscount = 0.0;
    double loyaltyDiscount = 0.0;

    if (student.isHostelite == true && subtotal > 500) {
      studentDiscount = subtotal * 0.15;
    } else if (student.isHostelite == false && subtotal > 700) {
      studentDiscount = subtotal * 0.10;
    }

    if (student.loyaltyPoints > 100) {
      loyaltyDiscount = 50.0;
    }

    double amountAfterDiscount = applyDiscount(
      subtotal,
      student.isHostelite,
      student.loyaltyPoints,
    );

    double voucherDiscount = voucherManager.applyVoucher(
      voucherCode,
      amountAfterDiscount,
    );

    // No tax percentage was given in assignment
    double tax = 0.0;

    double finalAmount =
        amountAfterDiscount - voucherDiscount + tax;

    print("\n========== CANTEEN RECEIPT ==========");

    print("Student Name: ${student.name}");
    print("Student ID: ${student.studentId}");

    print("\nItems:");

    for (String item in order.items) {
      print("$item : Rs. ${menu.menuItems[item]}");
    }

    print("------------------------------------");
    print("Subtotal: Rs. $subtotal");

    if (studentDiscount > 0) {
      if (student.isHostelite == true) {
        print("Hostelite Discount: Rs. $studentDiscount");
      } else {
        print("Day Scholar Discount: Rs. $studentDiscount");
      }
    }

    if (loyaltyDiscount > 0) {
      print("Loyalty Discount: Rs. $loyaltyDiscount");
    }

    print("Voucher Discount: Rs. $voucherDiscount");
    print("Tax: Rs. $tax");
    print("Final Amount: Rs. $finalAmount");
    print("------------------------------------");

    if (student.hasEnoughBalance(finalAmount)) {
      student.deductBalance(finalAmount);

      print("Payment Successful");
      print(
        "Remaining Balance: Rs. ${student.walletBalance}",
      );

      logger.logTransaction(
        student.studentId,
        finalAmount,
      );
    } else {
      print("Payment Failed");
      print("Reason: Insufficient Balance");
      print("Required: Rs. $finalAmount");
      print(
        "Available: Rs. ${student.walletBalance}",
      );
    }

    print("====================================");
  }
}