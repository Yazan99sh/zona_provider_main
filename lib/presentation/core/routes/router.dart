
import 'package:auto_route/annotations.dart';
import 'package:zona_provider_main/presentation/auth/pages/change_password_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/forget_password_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/login_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/sign_up_page.dart';
import 'package:zona_provider_main/presentation/core/pages/onboarding_page.dart';
import 'package:zona_provider_main/presentation/core/pages/splash_page.dart';
import 'package:zona_provider_main/presentation/home/pages/home_page.dart';
export 'router.gr.dart';
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: OnBoardingPage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: ChangePasswordPage),
    AutoRoute(page: ForgetPasswordPage),
    AutoRoute(page: SignUpPage),
    AutoRoute(page: HomePage),




  ],
)
class $AppRouter {}
