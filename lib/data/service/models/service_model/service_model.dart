import 'package:json_annotation/json_annotation.dart';
import 'package:zona_provider_main/domain/service/entities/service.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  final int id;
  final double? price;
  final String? image;
  final String? name;
  final String? description;
  @JsonKey(name: 'is_color')
  final int? isColor;
  @JsonKey(name: 'idcategory')
  final String? idCategory;
  @JsonKey(name: 'idprovider')
  final String? idProvider;
  final String? address;
  final double? rate;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  ServiceModel({
    required this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.isColor,
    this.idCategory,
    this.idProvider,
    this.address,
    this.rate,
  });
}

extension MapToDomain on ServiceModel {
  Service toDomain() => Service(
        id: id,
        price: price,
        image: image,
        name: name,
        description: description,
        isColor: isColor,
        idCategory: idCategory,
        idProvider: idProvider,
        address: address,
        rate: rate,
      );
}
