final List<OnboardingPageData> pages = const [
  OnboardingPageData(
    imageAsset: 'assets/images/onboarding_smart_man.svg',
    titleLines: ['Numerous free', 'trial courses'],
    bodyLines: ['Free courses for you to', 'find your way to learning'],
  ),
  OnboardingPageData(
    imageAsset: 'assets/images/onboarding_mobile_man.svg',
    titleLines: ['Learn anywhere', 'anytime'],
    bodyLines: ['Mobile-first lessons', 'for busy schedules'],
  ),
  OnboardingPageData(
    imageAsset: 'assets/images/onboarding_computer_man.svg',
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