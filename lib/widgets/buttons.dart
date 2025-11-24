import 'package:flutter/material.dart';
import 'package:study_project/onboarding/onboarding_notifier.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepControllButton extends StatelessWidget {
  final bool isActive;
  const StepControllButton({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      curve: isActive ? Curves.easeOut : Curves.easeIn,
      child: Container(
        width: isActive ? 28.w : 9.w,
        height: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5.r),
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
      ),
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
        ? Padding(
          padding: EdgeInsets.only(right: 24.w, top: 20.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(pages - 1);
                  },
                  child: Text(
                    "Skip",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
        )
        : const SizedBox();
  }
}

class AutorizationButton extends StatelessWidget {
  const AutorizationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(onPressed: () {}, child: Text('Sign up')),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: OutlinedButton(onPressed: () {}, child: Text('Log in')),
          ),
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  final PageController pageController;

  const NextButton({required this.pageController, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.slowMiddle,
                );
              },
              child: Text('Next step'),
            ),
          ),
        ],
      ),
    );
  }
}
