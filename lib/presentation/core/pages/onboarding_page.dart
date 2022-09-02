import 'package:auto_route/auto_route.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:zona_provider_main/injection.dart';
import 'package:zona_provider_main/presentation/core/auth/auth_bloc.dart';
import 'package:zona_provider_main/presentation/core/routes/router.dart';
import 'package:zona_provider_main/presentation/core/utils/generated_assets/assets.gen.dart';

import 'package:zona_provider_main/presentation/core/widgets/slide.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  late final List<Widget> _slides;
  int _currentIndex = 0;
  final double absoluteFooterHeight = 200.0;
  final AuthBloc _authBloc = getIt<AuthBloc>();
  @override
  void initState() {
    _slides = [
      OnBoardingSlide(
        image: Assets.images.onboarding.onboarding1.path,
        headText: 'head_text_onboarding1'.tr(),
      ),
      OnBoardingSlide(
        image: Assets.images.onboarding.onboarding2.path,
        headText: 'head_text_onboarding2'.tr(),
      ),
      OnBoardingSlide(
        image: Assets.images.onboarding.onboarding3.path,
        headText: 'head_text_onboarding3'.tr(),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: SingleChildScrollView(
                physics: (MediaQuery.of(context).size.height <
                        MediaQuery.of(context).size.height * 0.5 +
                            absoluteFooterHeight)
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height <
                          MediaQuery.of(context).size.height * 0.5 +
                              absoluteFooterHeight)
                      ? MediaQuery.of(context).size.height * 0.5 +
                          absoluteFooterHeight
                      : MediaQuery.of(context).size.height,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _slides.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, i) {
                      return _slides[i];
                    },
                  ),
                ),
              ),
            ),
            // Positioned(
            //     top: -20,
            //     left: -20,
            //     child: Container(
            //   width: 80,
            //   height: 80,
            //   decoration: const BoxDecoration(
            //     color: Color(0xffFFCACA),
            //     shape: BoxShape.circle,
            //   ),
            // )),
            if (_currentIndex != _slides.length - 1)
              Positioned(
                top: 30,
                right: 20,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xffB5EBCD),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      const Color(0xffB5EBCD),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  child: Text(
                    'skip'.tr(),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  onPressed: () {
                    _pageController.animateToPage(_slides.length - 1,
                        duration: const Duration(microseconds: 100),
                        curve: Curves.bounceIn);
                  },
                ),
              ),
          ],
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotsIndicator(
                  dotsCount: _slides.length,
                  position: _currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: Theme.of(context).colorScheme.secondary,
                    size: const Size.square(9.0),
                    activeSize: const Size(9.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                _currentIndex != _slides.length - 1
                    ? MaterialButton(
                        minWidth: 40,
                        height: 48,
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.bounceIn);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                      )
                    : MaterialButton(
                        minWidth: 140,
                        height: 48,
                        color: Theme.of(context).colorScheme.secondary,
                        textColor: Theme.of(context).colorScheme.onPrimary,
                        onPressed: () {
                          _authBloc.add(AuthSetFirstTimeLogged(isFirstTimeLogged: false));
                          AutoRouter.of(context).pushAndPopUntil(
                              const LoginPageRoute(),
                              predicate: (route) => false);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                        child: Text(
                          'get_started'.tr(),
                        ),
                      )
              ],
            )),
      ),
    );
  }
}
