import 'package:zona_provider_main/domain/user/entities/user_info.dart';

class User {
  final String token;
  final UserInfo userInfo;

  User({
    required this.token,
    required this.userInfo,
  });

  User copyWith(UserInfo userInfo) {
    return User(
      token: token,
      userInfo: userInfo,
    );
  }
}
