import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'message', defaultValue: '')
  final String? message;
  final int? totalRecords;
  final T? data;
  final int? code;

  BaseResponse({
    this.message,
    this.totalRecords,
    this.data,
    this.code,
  });

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
