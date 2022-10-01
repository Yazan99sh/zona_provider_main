import 'package:json_annotation/json_annotation.dart';

import 'package:zona_provider_main/data/user/models/user_info_model/user_info_model.dart';
import 'package:zona_provider_main/domain/user/entities/my_Profile.dart';

part 'my_profile_model.g.dart';

@JsonSerializable()
class MyProfileModel {
  final UserInfoModel? data;

  MyProfileModel(
    this.data,
  );

  factory MyProfileModel.fromJson(Map<String, dynamic> json) =>
      _$MyProfileModelFromJson(json);
}

extension MapToDomain on MyProfileModel {
  MyProfile toDomain() => MyProfile(
        data: data?.toDomain(),
      );
}
