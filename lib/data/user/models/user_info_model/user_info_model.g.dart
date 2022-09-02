// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map json) => UserInfoModel(
      json['id'] as int,
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['name'] as String?,
      json['phone'] as String?,
      $enumDecodeNullable(_$GenderModelEnumMap, json['gender']),
      json['email'] as String?,
      json['profile_image'] as String?,
      mapDateTimeFromJson(json['date_of_birth']),
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('name', instance.name);
  writeNotNull('phone', instance.phone);
  writeNotNull('gender', _$GenderModelEnumMap[instance.gender]);
  writeNotNull('email', instance.email);
  writeNotNull('profile_image', instance.profileImage);
  writeNotNull('date_of_birth', instance.dateOfBirth?.toIso8601String());
  return val;
}

const _$GenderModelEnumMap = {
  GenderModel.male: 'male',
  GenderModel.female: 'female',
};
