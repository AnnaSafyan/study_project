import 'package:flutter/material.dart';
import 'package:study_project/onboarding/onboarding_notifier.dart';

class StepControllButton extends StatelessWidget {
  final bool isActive;
  const StepControllButton({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      curve: isActive ? Curves.easeOut : Curves.easeIn,
      child: Container(
        width: isActive ? 28 : 9,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5),
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
