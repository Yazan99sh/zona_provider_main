
import 'package:auto_route/annotations.dart';
import 'package:zona_provider_main/presentation/auth/pages/change_password_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/forget_password_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/login_page.dart';
import 'package:zona_provider_main/presentation/core/pages/onboarding_page.dart';
import 'package:zona_provider_main/presentation/core/pages/splash_page.dart';
export 'router.gr.dart';
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage),
    AutoRoute(page: OnBoardingPage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: ChangePasswordPage),
    AutoRoute(page: ForgetPasswordPage, initial: true),




  ],
)
class $AppRouter {}
