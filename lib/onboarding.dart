import 'package:flutter/material.dart';

class OnboardingPageData {
  final String imageAsset;
  final List<String> titleLines;
  final List<String> bodyLines;

  const OnboardingPageData({
    required this.imageAsset,
    required this.titleLines,
    required this.bodyLines,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingPageData> pages = const [
    OnboardingPageData(
      imageAsset: 'assets/images/img_onboarding_smart_man.webp',
      titleLines: ['Numerous free', 'trial courses'],
      bodyLines: ['Free courses for you to', 'find your way to learning'],
    ),
    OnboardingPageData(
      imageAsset: 'assets/images/img_onboarding_mobile_man.webp',
      titleLines: ['Learn anywhere', 'anytime'],
      bodyLines: ['Mobile-first lessons', 'for busy schedules'],
    ),
    OnboardingPageData(
      imageAsset: 'assets/images/img_onboarding_computer_man.webp',
      titleLines: ['Track progress', 'and stay motivated'],
      bodyLines: ['Daily streaks and tips', 'to keep consistency'],
    ),
  ];

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
        child: PageView.builder(
          controller: pageController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final isLastPage = pages.length - 1 == index;

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkipButton(
                  pagesCount: pages.length,
                  indexPage: index,
                  pageController: pageController,
                ),
                ScrollingContent(activePageIndex: index, pages: pages[index]),
                if (!isLastPage) NextButton(pageController: pageController),
                if (isLastPage) AutorizationButton(),
              ],
            );
          },
          onPageChanged: (index) {
            print(index);
          },
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  final int pagesCount;
  final int indexPage;
  final PageController pageController;
  const SkipButton({
    super.key,
    required this.pagesCount,
    required this.indexPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return indexPage != 2
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  pageController.jumpToPage(pagesCount - 1);
                  print('Нажали на кнопку skip');
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text(
                    "Skip",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}

class ScrollingContent extends StatelessWidget {
  final int activePageIndex;
  final OnboardingPageData pages;
  const ScrollingContent({super.key, required this.activePageIndex, required this.pages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.asset(pages.imageAsset, width: 260, height: 260),
            const SizedBox(height: 38),
            Text(pages.titleLines[0], style: Theme.of(context).textTheme.headlineLarge),
            Text(pages.titleLines[1], style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 18),
            Text(
              pages.bodyLines[0],
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Text(
              pages.bodyLines[1],
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
        const SizedBox(height: 26),
        StepControl(activePageIndex: activePageIndex),
      ],
    );
  }
}

class StepControllButton extends StatelessWidget {
  final bool isActive;
  const StepControllButton({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            width: 28,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5),
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        : Container(
            width: 9,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5),
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
  }
}

class StepControl extends StatelessWidget {
  final int activePageIndex;
  const StepControl({super.key, required this.activePageIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StepControllButton(isActive: activePageIndex == 0),
        const SizedBox(width: 10),
        StepControllButton(isActive: activePageIndex == 1),
        const SizedBox(width: 10),
        StepControllButton(isActive: activePageIndex == 2),
      ],
    );
  }
}

class AutorizationButton extends StatelessWidget {
  const AutorizationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 15,
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  print('pressed sign up');
                },
                style: ElevatedButton.styleFrom(fixedSize: Size(160, 50)),
                child: Text('Sign up'),
              ),
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  print('pressed log in');
                },
                style: ElevatedButton.styleFrom(fixedSize: Size(160, 50)),
                child: Text('Log in'),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  final PageController pageController;

  const NextButton({required this.pageController, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 15,
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () => pageController.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.slowMiddle,
                ),
                style: ElevatedButton.styleFrom(fixedSize: Size(160, 50)),
                child: Text('Next step'),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
