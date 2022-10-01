// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderModel _$ProviderModelFromJson(Map json) => ProviderModel(
      id: json['id'] as int,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      profileImage: json['profile_image'] as String?,
      gender: $enumDecodeNullable(_$GenderModelEnumMap, json['gender']),
      dateOfBirth: mapDateTimeFromJson(json['date_of_birth']),
    );

const _$GenderModelEnumMap = {
  GenderModel.male: 'male',
  GenderModel.female: 'female',
};
