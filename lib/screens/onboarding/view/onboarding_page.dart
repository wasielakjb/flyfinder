import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/screens/onboarding/models/onboarding_resource.dart';
import 'package:flyfinder/screens/onboarding/widgets/onboarding_wgt.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController controller;
  int currentIndex = 0;
  final List<OnboardingResource> pages = [
    const OnboardingResource(
      title: 'Your Travel Adventure Begins Here',
      subtitle: 'Experience seamless flight booking, exclusive deals, and personalized travel options, all in one place.',
      imageUrl: 'assets/onboarding_1.png',
    ),
    const OnboardingResource(
      title: 'Your Flight Search Made Effortless',
      subtitle: 'Search and find the best flights from around the world. Customize your preferences, compare fares, and book with ease.',
      imageUrl: 'assets/onboarding_2.png',
    ),
    const OnboardingResource(
      title: 'Seamless Flight Booking at Your Fingertips',
      subtitle: 'With Airify, you can secure your dream trip in just a few taps. Enjoy streamlined booking. real-time updates, & secure payment.',
      imageUrl: 'assets/onboarding_3.png',
    ),
  ];

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: context.primary,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) => setState(() {
                  currentIndex = value;
                }),
                itemCount: pages.length,
                itemBuilder: (context, index) => OnBoardingWidget(
                  item: pages[index],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 8,
                    width: currentIndex == index ? 32 : 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: currentIndex == index
                          ? context.primary
                          : context.outlineVariant,
                    ),
                  ),
                ),
              ),
            ),
            Divider(color: context.surfaceContainer),
            Padding(
              padding: const EdgeInsetsGeometry.all(24),
              child: Row(
                spacing: 16,
                children: [
                  if (currentIndex != pages.length - 1)
                    Expanded(
                      child: FilledButton.tonal(
                        style: FilledButton.styleFrom(
                          foregroundColor: context.primary,
                        ),
                        onPressed: () {},
                        child: const Text('Skip'),
                      ),
                    ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      ),
                      child: const Text('Continue'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
