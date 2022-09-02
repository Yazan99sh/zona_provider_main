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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../auth/pages/change_password_page.dart' as _i4;
import '../../auth/pages/forget_password_page.dart' as _i5;
import '../../auth/pages/login_page.dart' as _i3;
import '../../auth/pages/sign_up_page.dart' as _i6;
import '../../home/pages/home_page.dart' as _i7;
import '../pages/onboarding_page.dart' as _i2;
import '../pages/splash_page.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    OnBoardingPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnBoardingPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ChangePasswordPage());
    },
    ForgetPasswordPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ForgetPasswordPage());
    },
    SignUpPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SignUpPage());
    },
    HomePageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomePage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashPageRoute.name, path: '/'),
        _i8.RouteConfig(OnBoardingPageRoute.name, path: '/on-boarding-page'),
        _i8.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i8.RouteConfig(ChangePasswordPageRoute.name,
            path: '/change-password-page'),
        _i8.RouteConfig(ForgetPasswordPageRoute.name,
            path: '/forget-password-page'),
        _i8.RouteConfig(SignUpPageRoute.name, path: '/sign-up-page'),
        _i8.RouteConfig(HomePageRoute.name, path: '/home-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i8.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.OnBoardingPage]
class OnBoardingPageRoute extends _i8.PageRouteInfo<void> {
  const OnBoardingPageRoute()
      : super(OnBoardingPageRoute.name, path: '/on-boarding-page');

  static const String name = 'OnBoardingPageRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginPageRoute extends _i8.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i4.ChangePasswordPage]
class ChangePasswordPageRoute extends _i8.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(ChangePasswordPageRoute.name, path: '/change-password-page');

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i5.ForgetPasswordPage]
class ForgetPasswordPageRoute extends _i8.PageRouteInfo<void> {
  const ForgetPasswordPageRoute()
      : super(ForgetPasswordPageRoute.name, path: '/forget-password-page');

  static const String name = 'ForgetPasswordPageRoute';
}

/// generated route for
/// [_i6.SignUpPage]
class SignUpPageRoute extends _i8.PageRouteInfo<void> {
  const SignUpPageRoute() : super(SignUpPageRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [_i7.HomePage]
class HomePageRoute extends _i8.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}
