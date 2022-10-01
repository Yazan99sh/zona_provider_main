import 'package:json_annotation/json_annotation.dart';
import 'package:zona_provider_main/domain/service/entities/payment.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel {
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @JsonKey(name: 'idorder')
  final int? idOrder;
  final int? amount;
  final String? status;
  @JsonKey(name: 'order_id')
  final int? orderId;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'method_of_payment')
  final String? methodOfPayment;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  PaymentModel({
    required this.transactionId,
    this.idOrder,
    this.amount,
    this.status,
    this.orderId,
    this.userId,
    this.methodOfPayment,
  });
}

extension MapToDomain on PaymentModel {
  Payment toDomain() => Payment(
        transactionId: transactionId,
        idOrder: idOrder,
        amount: amount,
        status: status,
        orderId: orderId,
        userId: userId,
        methodOfPayment: methodOfPayment,
      );
}
