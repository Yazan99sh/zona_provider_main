import 'package:json_annotation/json_annotation.dart';
import 'package:zona_provider_main/data/service/models/payment_model/payment_model.dart';
import 'package:zona_provider_main/data/service/models/provider_model/provider_model.dart';

import 'package:zona_provider_main/domain/service/entities/bill.dart';

part 'bill_model.g.dart';

@JsonSerializable()
class BillModel {
  final int id;
  final String? name;
  @JsonKey(name: 'order_number')
  final String? orderNumber;
  @JsonKey(name: 'date', fromJson: mapDateTimeFromJson)
  final DateTime? date;
  final DateTime? time;
  final String? address;
  final String? phone;
  @JsonKey(name: 'total_price')
  final double? totalPrice;
  final String? color;
  final String? location;
  final String? notes;
  final double? longitude;
  final double? latitude;
  @JsonKey(name: 'tax_number')
  final double? taxNumber;
  final String? status;
  final String? username;
  final ProviderModel? provider;
  final PaymentModel? payment;

  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);

  BillModel({
    required this.id,
    this.name,
    this.orderNumber,
    this.date,
    this.time,
    this.address,
    this.phone,
    this.totalPrice,
    this.color,
    this.location,
    this.notes,
    this.longitude,
    this.latitude,
    this.taxNumber,
    this.status,
    this.username,
    this.provider,
    this.payment,
  });
}

extension MapToDomain on BillModel {
  Bill toDomain() => Bill(
        id: id,
        name: name,
        orderNumber: orderNumber,
        status: status,
        date: date,
        time: time,
        address: address,
        phone: phone,
        totalPrice: totalPrice,
        color: color,
        location: location,
        notes: notes,
        longitude: longitude,
        latitude: latitude,
        taxNumber: taxNumber,
        username: username,
        provider: provider?.toDomain(),
        payment: payment?.toDomain(),
      );
}

DateTime? mapDateTimeFromJson(value) {
  if (value is String) return null;

  return value;
}
