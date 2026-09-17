import 'student.dart';
import 'canteen_menu.dart';
import 'order.dart';
import 'voucher_manager.dart';
import 'billing_engine.dart';
import 'transaction_logger.dart';

void main() {
  Student student1 = Student(
    "Ali Khan",
    "CSC-101",
    1500.0,
    true,
    120,
    true,
  );

  CanteenMenu menu = CanteenMenu();

  Order order = Order();

  VoucherManager voucherManager = VoucherManager();

  BillingEngine billing = BillingEngine();

  TransactionLogger logger = TransactionLogger();

  student1.displayProfile();

  if (student1.canPlaceOrder()) {
    print("\nStudent can place an order.");

    menu.showMenu();

    order.addItem("Chicken Roll");
    order.addItem("Coffee");
    order.addItem("Fries");

    order.showOrder();

    billing.checkout(
      student1,
      order,
      menu,
      voucherManager,
      logger,
      "CAMPUS50",
    );
  } else {
    print("\nStudent cannot place an order.");
  }
}