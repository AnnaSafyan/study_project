import 'package:flutter/material.dart';
import 'package:study_project/theme/dark_theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
              print("swipe from right to left");
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [SkipButton(), ScrollingContent(), NextButton(), AutorizationButton()],
          ),
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
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
    );
  }
}

class ScrollingContent extends StatelessWidget {
  const ScrollingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.asset('assets/images/img_onboarding_smart_man.webp', width: 260, height: 260),
            const SizedBox(height: 38),
            Text(
              "Numerous free",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
            ),
            Text(
              "trial courses",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              "Free courses for you to",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Text(
              "find your way to learning",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
        const SizedBox(height: 26),
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
        Container(
          width: 28,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 9,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 9,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
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
  const NextButton({super.key});

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
                  print('pressed next');
                },
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
