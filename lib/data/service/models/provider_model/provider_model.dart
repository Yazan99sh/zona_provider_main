import 'package:json_annotation/json_annotation.dart';
import 'package:zona_provider_main/data/user/models/enums/gender_model.dart';
import 'package:zona_provider_main/domain/service/entities/provider.dart';

part 'provider_model.g.dart';

@JsonSerializable()
class ProviderModel {
  final int id;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? email;
  final String? phone;
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  final GenderModel? gender;
  @JsonKey(name: 'date_of_birth', fromJson: mapDateTimeFromJson)
  final DateTime? dateOfBirth;

  factory ProviderModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderModelFromJson(json);

  ProviderModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.profileImage,
    this.gender,
    this.dateOfBirth,
  });
}

extension MapToDomain on ProviderModel {
  Provider toDomain() => Provider(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        profileImage: profileImage,
        gender: gender?.toDomain(),
        dateOfBirth: dateOfBirth,
      );
}

DateTime? mapDateTimeFromJson(value) {
  if (value is String) return null;

  return value;
}
