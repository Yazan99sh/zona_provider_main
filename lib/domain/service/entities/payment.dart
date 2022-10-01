class Payment {
  final String transactionId;
  final int? idOrder;
  final int? amount;
  final String? status;
  final int? orderId;
  final String? userId;
  final String? methodOfPayment;

  Payment({
    required this.transactionId,
    this.idOrder,
    this.amount,
    this.status,
    this.orderId,
    this.userId,
    this.methodOfPayment,
  });
}
