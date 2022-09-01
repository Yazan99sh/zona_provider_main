import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zona_provider_main/presentation/core/resources/theme.dart';
import 'package:zona_provider_main/presentation/core/routes/router.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, w) {
          return MaterialApp.router(
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
            theme: getThemeData(context),
            builder: (context, widget) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(
                    physics: const BouncingScrollPhysics(),
                  ),
                  child: SafeArea(
                    top: false,
                    left: false,
                    right: false,
                    child: widget!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
