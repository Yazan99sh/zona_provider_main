import 'package:zona_provider_main/domain/service/entities/payment.dart';
import 'package:zona_provider_main/domain/service/entities/provider.dart';

class Bill {
  final int id;
  final String? name;
  final String? orderNumber;
  final DateTime? date;
  final DateTime? time;
  final String? address;
  final String? phone;
  final double? totalPrice;
  final String? color;
  final String? location;
  final String? notes;
  final double? longitude;
  final double? latitude;
  final double? taxNumber;
  final String? status;
  final String? username;
  final Provider? provider;
  final Payment? payment;

  Bill({
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
