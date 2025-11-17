import 'package:flutter/material.dart';
import 'package:study_project/onboarding/_export.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;
  int indexCount = 0;

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
                bottom: 40,
                left: 0,
                right: 0,
                child: ActionButtonField(pageController: pageController),
              ),
              SkipButton(pages: pages.length, pageController: pageController),
              Positioned(bottom: 180, left: 0, right: 0, child: StepControl()),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(pages.imageAsset, width: 260, height: 260),
        const SizedBox(height: 10),
        Text(
          pages.titleLines[0],
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          pages.titleLines[1],
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 18),
        Text(pages.bodyLines[0], style: Theme.of(context).textTheme.bodyMedium),
        Text(pages.bodyLines[1], style: Theme.of(context).textTheme.bodyMedium),
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
        const SizedBox(width: 10),
        StepControllButton(
          isActive: PageCounterProvider.of(context)?.pageCount == 1,
        ),
        const SizedBox(width: 10),
        StepControllButton(
          isActive: PageCounterProvider.of(context)?.pageCount == 2,
        ),
      ],
    );
  }
}


