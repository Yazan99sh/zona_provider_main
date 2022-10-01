// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillModel _$BillModelFromJson(Map json) => BillModel(
      id: json['id'] as int,
      name: json['name'] as String?,
      orderNumber: json['order_number'] as String?,
      date: mapDateTimeFromJson(json['date']),
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      color: json['color'] as String?,
      location: json['location'] as String?,
      notes: json['notes'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      taxNumber: (json['tax_number'] as num?)?.toDouble(),
      status: json['status'] as String?,
      username: json['username'] as String?,
      provider: json['provider'] == null
          ? null
          : ProviderModel.fromJson(
              Map<String, dynamic>.from(json['provider'] as Map)),
      payment: json['payment'] == null
          ? null
          : PaymentModel.fromJson(
              Map<String, dynamic>.from(json['payment'] as Map)),
    );
