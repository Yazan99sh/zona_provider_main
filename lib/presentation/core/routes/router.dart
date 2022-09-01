
import 'package:auto_route/annotations.dart';
import 'package:zona_provider_main/presentation/core/pages/onboarding_page.dart';
import 'package:zona_provider_main/presentation/core/pages/splash_page.dart';
export 'router.gr.dart';
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage),
    AutoRoute(page: OnBoardingPage, initial: true),




  ],
)
class $AppRouter {}
