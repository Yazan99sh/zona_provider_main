// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map json) => PaymentModel(
      transactionId: json['transaction_id'] as String,
      idOrder: json['idorder'] as int?,
      amount: json['amount'] as int?,
      status: json['status'] as String?,
      orderId: json['order_id'] as int?,
      userId: json['user_id'] as String?,
      methodOfPayment: json['method_of_payment'] as String?,
    );
