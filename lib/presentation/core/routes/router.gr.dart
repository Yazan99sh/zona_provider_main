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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../auth/pages/change_password_page.dart' as _i4;
import '../../auth/pages/forget_password_page.dart' as _i5;
import '../../auth/pages/login_page.dart' as _i3;
import '../pages/onboarding_page.dart' as _i2;
import '../pages/splash_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    OnBoardingPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnBoardingPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ChangePasswordPage());
    },
    ForgetPasswordPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ForgetPasswordPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashPageRoute.name, path: '/splash-page'),
        _i6.RouteConfig(OnBoardingPageRoute.name, path: '/on-boarding-page'),
        _i6.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i6.RouteConfig(ChangePasswordPageRoute.name,
            path: '/change-password-page'),
        _i6.RouteConfig(ForgetPasswordPageRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i6.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/splash-page');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.OnBoardingPage]
class OnBoardingPageRoute extends _i6.PageRouteInfo<void> {
  const OnBoardingPageRoute()
      : super(OnBoardingPageRoute.name, path: '/on-boarding-page');

  static const String name = 'OnBoardingPageRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginPageRoute extends _i6.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i4.ChangePasswordPage]
class ChangePasswordPageRoute extends _i6.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(ChangePasswordPageRoute.name, path: '/change-password-page');

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i5.ForgetPasswordPage]
class ForgetPasswordPageRoute extends _i6.PageRouteInfo<void> {
  const ForgetPasswordPageRoute()
      : super(ForgetPasswordPageRoute.name, path: '/');

  static const String name = 'ForgetPasswordPageRoute';
}
