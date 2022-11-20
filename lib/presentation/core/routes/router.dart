import 'package:auto_route/annotations.dart';
import 'package:zona_provider_main/presentation/auth/pages/check_reset_password_code_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/edit_my_profile_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/my_profile_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/reset_password_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/forget_password_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/login_page.dart';
import 'package:zona_provider_main/presentation/auth/pages/sign_up_page.dart';
import 'package:zona_provider_main/presentation/core/pages/onboarding_page.dart';
import 'package:zona_provider_main/presentation/core/pages/splash_page.dart';
import 'package:zona_provider_main/presentation/home/pages/home_page.dart';
import 'package:zona_provider_main/presentation/service/pages/add_edit_service_page.dart';
export 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: OnBoardingPage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: ResetPasswordPage),
    AutoRoute(page: ForgetPasswordPage),
    AutoRoute(page: CheckResetPasswordCodePage),
    AutoRoute(page: SignUpPage),
    AutoRoute(page: MyProfilePage),
    AutoRoute(page: EditMuProfilePage),
    AutoRoute(page: HomePage),
    AutoRoute(page: AddEditServicePage),
  ],
)
class $AppRouter {}
