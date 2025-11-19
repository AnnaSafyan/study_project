import 'package:flutter/material.dart';
import 'package:study_project/onboarding/_export.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageCounterProvider(
          model: model,
          child: Stack(
            children: [
              PageViewBuilder(pageController: pageController),
              Positioned(
                bottom: 40.h,
                left: 0.w,
                right: 0.w,
                child: ActionButtonField(pageController: pageController),
              ),
              SkipButton(pages: pages.length, pageController: pageController),
            ],
          ),
        ),
      ),
    );
  }
}

class PageViewBuilder extends StatelessWidget {
  final PageController pageController;
  const PageViewBuilder({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return ScrollingContent(pages: pages[index]);
      },
      onPageChanged: (index) {
        PageCounterProvider.of(context)?.changePageCount(index);
      },
    );
  }
}

class ScrollingContent extends StatelessWidget {
  final OnboardingPageData pages;
  const ScrollingContent({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 112.h),
        SvgPicture.asset(pages.imageAsset, height: 260.h, width: 260.w),
        SizedBox(height: 38.h),
        Text(
          pages.titleLines[0],
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          pages.titleLines[1],
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: 18.h),
        Text(pages.bodyLines[0], style: Theme.of(context).textTheme.bodySmall),
        Text(pages.bodyLines[1], style: Theme.of(context).textTheme.bodySmall),
        SizedBox(height: 26.h),
        StepControl(),
      ],
    );
  }
}

class StepControl extends StatelessWidget {
  const StepControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StepControllButton(
          isActive: PageCounterProvider.of(context)?.pageCount == 0,
        ),
        SizedBox(width: 10.w),
        StepControllButton(
          isActive: PageCounterProvider.of(context)?.pageCount == 1,
        ),
        SizedBox(width: 10.w),
        StepControllButton(
          isActive: PageCounterProvider.of(context)?.pageCount == 2,
        ),
      ],
    );
  }
}

class ActionButtonField extends StatelessWidget {
  final PageController pageController;

  const ActionButtonField({required this.pageController, super.key});

  @override
  Widget build(BuildContext context) {
    final pageCountInherite = PageCounterProvider.of(context)?.pageCount;
    if (pageCountInherite == null) return const SizedBox.expand();

    return pageCountInherite != pages.length - 1
        ? NextButton(pageController: pageController)
        : AutorizationButton();
  }
}
