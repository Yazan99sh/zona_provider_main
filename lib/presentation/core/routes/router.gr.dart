// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../../domain/service/entities/service.dart' as _i14;
import '../../auth/pages/check_reset_password_code_page.dart' as _i6;
import '../../auth/pages/edit_my_profile_page.dart' as _i9;
import '../../auth/pages/forget_password_page.dart' as _i5;
import '../../auth/pages/login_page.dart' as _i3;
import '../../auth/pages/my_profile_page.dart' as _i8;
import '../../auth/pages/reset_password_page.dart' as _i4;
import '../../auth/pages/sign_up_page.dart' as _i7;
import '../../home/pages/home_page.dart' as _i10;
import '../../service/pages/add_edit_service_page.dart' as _i11;
import '../pages/onboarding_page.dart' as _i2;
import '../pages/splash_page.dart' as _i1;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    OnBoardingPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnBoardingPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    ResetPasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordPageRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ResetPasswordPage(
              key: args.key, resetPasswordCode: args.resetPasswordCode));
    },
    ForgetPasswordPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ForgetPasswordPage());
    },
    CheckResetPasswordCodePageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CheckResetPasswordCodePage());
    },
    SignUpPageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SignUpPage());
    },
    MyProfilePageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.MyProfilePage());
    },
    EditMuProfilePageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EditMuProfilePage());
    },
    HomePageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.HomePage());
    },
    AddEditServicePageRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditServicePageRouteArgs>(
          orElse: () => const AddEditServicePageRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.AddEditServicePage(key: args.key, service: args.service));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashPageRoute.name, path: '/'),
        _i12.RouteConfig(OnBoardingPageRoute.name, path: '/on-boarding-page'),
        _i12.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i12.RouteConfig(ResetPasswordPageRoute.name,
            path: '/reset-password-page'),
        _i12.RouteConfig(ForgetPasswordPageRoute.name,
            path: '/forget-password-page'),
        _i12.RouteConfig(CheckResetPasswordCodePageRoute.name,
            path: '/check-reset-password-code-page'),
        _i12.RouteConfig(SignUpPageRoute.name, path: '/sign-up-page'),
        _i12.RouteConfig(MyProfilePageRoute.name, path: '/my-profile-page'),
        _i12.RouteConfig(EditMuProfilePageRoute.name,
            path: '/edit-mu-profile-page'),
        _i12.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i12.RouteConfig(AddEditServicePageRoute.name,
            path: '/add-edit-service-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i12.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.OnBoardingPage]
class OnBoardingPageRoute extends _i12.PageRouteInfo<void> {
  const OnBoardingPageRoute()
      : super(OnBoardingPageRoute.name, path: '/on-boarding-page');

  static const String name = 'OnBoardingPageRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginPageRoute extends _i12.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i4.ResetPasswordPage]
class ResetPasswordPageRoute
    extends _i12.PageRouteInfo<ResetPasswordPageRouteArgs> {
  ResetPasswordPageRoute({_i13.Key? key, required String resetPasswordCode})
      : super(ResetPasswordPageRoute.name,
            path: '/reset-password-page',
            args: ResetPasswordPageRouteArgs(
                key: key, resetPasswordCode: resetPasswordCode));

  static const String name = 'ResetPasswordPageRoute';
}

class ResetPasswordPageRouteArgs {
  const ResetPasswordPageRouteArgs({this.key, required this.resetPasswordCode});

  final _i13.Key? key;

  final String resetPasswordCode;

  @override
  String toString() {
    return 'ResetPasswordPageRouteArgs{key: $key, resetPasswordCode: $resetPasswordCode}';
  }
}

/// generated route for
/// [_i5.ForgetPasswordPage]
class ForgetPasswordPageRoute extends _i12.PageRouteInfo<void> {
  const ForgetPasswordPageRoute()
      : super(ForgetPasswordPageRoute.name, path: '/forget-password-page');

  static const String name = 'ForgetPasswordPageRoute';
}

/// generated route for
/// [_i6.CheckResetPasswordCodePage]
class CheckResetPasswordCodePageRoute extends _i12.PageRouteInfo<void> {
  const CheckResetPasswordCodePageRoute()
      : super(CheckResetPasswordCodePageRoute.name,
            path: '/check-reset-password-code-page');

  static const String name = 'CheckResetPasswordCodePageRoute';
}

/// generated route for
/// [_i7.SignUpPage]
class SignUpPageRoute extends _i12.PageRouteInfo<void> {
  const SignUpPageRoute() : super(SignUpPageRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [_i8.MyProfilePage]
class MyProfilePageRoute extends _i12.PageRouteInfo<void> {
  const MyProfilePageRoute()
      : super(MyProfilePageRoute.name, path: '/my-profile-page');

  static const String name = 'MyProfilePageRoute';
}

/// generated route for
/// [_i9.EditMuProfilePage]
class EditMuProfilePageRoute extends _i12.PageRouteInfo<void> {
  const EditMuProfilePageRoute()
      : super(EditMuProfilePageRoute.name, path: '/edit-mu-profile-page');

  static const String name = 'EditMuProfilePageRoute';
}

/// generated route for
/// [_i10.HomePage]
class HomePageRoute extends _i12.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i11.AddEditServicePage]
class AddEditServicePageRoute
    extends _i12.PageRouteInfo<AddEditServicePageRouteArgs> {
  AddEditServicePageRoute({_i13.Key? key, _i14.Service? service})
      : super(AddEditServicePageRoute.name,
            path: '/add-edit-service-page',
            args: AddEditServicePageRouteArgs(key: key, service: service));

  static const String name = 'AddEditServicePageRoute';
}

class AddEditServicePageRouteArgs {
  const AddEditServicePageRouteArgs({this.key, this.service});

  final _i13.Key? key;

  final _i14.Service? service;

  @override
  String toString() {
    return 'AddEditServicePageRouteArgs{key: $key, service: $service}';
  }
}
