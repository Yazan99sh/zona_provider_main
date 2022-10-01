part of 'update_profile_bloc.dart';

@immutable
abstract class UpdateProfileEvent {}

class UpdateProfileRequested extends UpdateProfileEvent {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final Gender? gender;
  final File? profileImage;
  final DateTime? dateOfBirth;

  UpdateProfileRequested({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.gender,
    this.profileImage,
    this.dateOfBirth,
  });
}
