part of 'update_service_bloc.dart';

@immutable
abstract class UpdateServiceEvent {}

class UpdateServiceRequested extends UpdateServiceEvent {
  final int id;
  final String? name;
  final String? description;
  final double? price;
  final int? idCategory;
  final String? address;
  final double? totalPrice;
  final int? idProvider;
  final int? isColor;
  final int? status;
  final File? image;
  final double? rate;

  UpdateServiceRequested({
    required this.id,
    this.name,
    this.description,
    this.price,
    this.idCategory,
    this.address,
    this.totalPrice,
    this.idProvider,
    this.isColor,
    this.status,
    this.image,
    this.rate,
  });
}
