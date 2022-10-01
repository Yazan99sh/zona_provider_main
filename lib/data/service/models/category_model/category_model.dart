import 'package:json_annotation/json_annotation.dart';

import 'package:zona_provider_main/domain/service/entities/category.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String? name;
  final String? image;
  final String? color;
  final String? description;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryModel({
    required this.id,
    this.name,
    this.image,
    this.color,
    this.description,
  });
}

extension MapToDomain on CategoryModel {
  Category toDomain() => Category(
        id: id,
        name: name,
        image: image,
        color: color,
        description: description,
      );
}
