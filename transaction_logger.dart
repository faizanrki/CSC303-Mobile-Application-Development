class TransactionLogger {
  void logTransaction(String studentId, double amount) =>
      print(
        "Transaction successful | "
        "Student ID: $studentId | "
        "Amount: Rs. $amount | "
        "Time: ${DateTime.now()}",
      );
}