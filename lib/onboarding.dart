import 'package:flutter/material.dart';

final model = PageCounterViewModel.init();

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
                child: ActionButton(pageController: pageController),
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

class ActionButton extends StatelessWidget {
  final PageController pageController;

  const ActionButton({required this.pageController, super.key});

  @override
  Widget build(BuildContext context) {
    final pageCountInherite = PageCounterProvider.of(context)?.pageCount;
    if (pageCountInherite == null) return const SizedBox.expand();

    return pageCountInherite != pages.length - 1
        ? NextButton(pageController: pageController)
        : AutorizationButton();
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(fixedSize: Size(160, 50)),
                child: Text('Sign up'),
              ),
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(fixedSize: Size(160, 50)),
                child: Text('Log in'),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  final PageController pageController;

  const NextButton({required this.pageController, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 15,
      children: [
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              pageController.nextPage(
                duration: Duration(milliseconds: 400),
                curve: Curves.slowMiddle,
              );
            },
            style: ElevatedButton.styleFrom(fixedSize: Size(160, 50)),
            child: Text('Next step'),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class SkipButton extends StatelessWidget {
  final int pages;
  final PageController pageController;

  const SkipButton({
    super.key,
    required this.pages,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return PageCounterProvider.of(context)?.pageCount != 2
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  pageController.jumpToPage(pages - 1);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text(
                    "Skip",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          )
        : const SizedBox();
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

class PageCounterViewModel extends ChangeNotifier {
  int pageCount;

  PageCounterViewModel({required this.pageCount});

  factory PageCounterViewModel.init() {
    return PageCounterViewModel(pageCount: 0);
  }

  void changePageCount(int pageViewIndex) {
    pageCount = pageViewIndex;
    notifyListeners();
  }
}

class PageCounterProvider extends InheritedNotifier<PageCounterViewModel> {
  final PageCounterViewModel model;

  const PageCounterProvider({
    super.key,
    required this.model,
    required super.child,
  }) : super(notifier: model);

  static PageCounterViewModel? of(BuildContext context) {
    final model = context
        .dependOnInheritedWidgetOfExactType<PageCounterProvider>()
        ?.model;

    return model;
  }
}
