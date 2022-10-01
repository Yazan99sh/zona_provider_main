part of 'add_service_bloc.dart';

@immutable
abstract class AddServiceEvent {}

class AddServiceRequested extends AddServiceEvent {
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

  AddServiceRequested({
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
  });
}
