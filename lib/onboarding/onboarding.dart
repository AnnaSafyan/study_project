import 'package:flutter/material.dart';
import 'package:study_project/onboarding/_export.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;
  final OnboardingBloc _bloc = OnboardingBloc();

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<OnboardingState>(
          stream: _bloc.stream,
          initialData: _bloc.state,
          builder: (_, __) {
            return Stack(
              children: [
                PageViewBuilder(
                  onboardingBloc: _bloc,
                  pageController: pageController,
                  pageIndex: _bloc.state.pageIndex,
                ),
                Positioned(
                  bottom: 40.h,
                  left: 0.w,
                  right: 0.w,
                  child: ActionButtonField(
                    pageController: pageController,
                    pageIndex: _bloc.state.pageIndex,
                  ),
                ),
                SkipButton(
                  pages: pages.length,
                  pageController: pageController,
                  pageIndex: _bloc.state.pageIndex,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class PageViewBuilder extends StatelessWidget {
  final PageController pageController;
  final OnboardingBloc onboardingBloc;
  final int pageIndex;
  const PageViewBuilder({
    super.key,
    required this.pageController,
    required this.pageIndex,
    required this.onboardingBloc,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return ScrollingContent(pages: pages[index], pageIndex: pageIndex);
      },
      onPageChanged: (index) {
        onboardingBloc.add(OnIndexChanged(index));
      },
    );
  }
}

class ScrollingContent extends StatelessWidget {
  final OnboardingPageData pages;
  final int pageIndex;
  const ScrollingContent({
    super.key,
    required this.pages,
    required this.pageIndex,
  });

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
        StepControl(pageIndex: pageIndex),
      ],
    );
  }
}

class StepControl extends StatelessWidget {
  final int pageIndex;
  const StepControl({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StepControllButton(isActive: pageIndex == 0),
        SizedBox(width: 10.w),
        StepControllButton(isActive: pageIndex == 1),
        SizedBox(width: 10.w),
        StepControllButton(isActive: pageIndex == 2),
      ],
    );
  }
}

class ActionButtonField extends StatelessWidget {
  final int pageIndex;
  final PageController pageController;

  const ActionButtonField({
    required this.pageController,
    required this.pageIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageCount = pageIndex;

    return pageCount != pages.length - 1
        ? NextButton(pageController: pageController)
        : AutorizationButton();
  }
}
