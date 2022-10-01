// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map json) => ServiceModel(
      id: json['id'] as int,
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      isColor: json['is_color'] as int?,
      idCategory: json['idcategory'] as String?,
      idProvider: json['idprovider'] as String?,
      address: json['address'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
    );
