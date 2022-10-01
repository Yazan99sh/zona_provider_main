import 'package:zona_provider_main/domain/user/entities/enums/gender.dart';

class Provider {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? profileImage;
  final Gender? gender;
  final DateTime? dateOfBirth;

  Provider({
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
