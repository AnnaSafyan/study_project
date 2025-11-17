import 'package:flutter/material.dart';

final model = CounterViewModel.init();

class AppExampleInherid extends StatelessWidget {
  const AppExampleInherid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: OurProvider(
            model: model,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FistBTNWidget(),
                const TextOneNew(),
                const SizedBox(height: 50),
                SecondBTNWidget(),
                const TextTwoNew(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FistBTNWidget extends StatelessWidget {
  const FistBTNWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        OurProvider.of(context)?.changeFirstBTN();
      },
      child: Text('Изменить первое значение'),
    );
  }
}

class SecondBTNWidget extends StatelessWidget {
  const SecondBTNWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        OurProvider.of(context)?.changeSecondBTN();
      },
      child: Text('Изменить первое значение'),
    );
  }
}

class TextOneNew extends StatelessWidget {
  const TextOneNew({super.key});

  @override
  Widget build(BuildContext context) {
    // подписываемся на изменения
    final intValue = OurProvider.of(context)?.firstBtnValue;

    final resultValue = intValue == null ? '' : intValue.toString();

    return Text(resultValue);
  }
}

class TextTwoNew extends StatelessWidget {
  const TextTwoNew({super.key});

  @override
  Widget build(BuildContext context) {
    // подписываемся на изменения
    final intValue = OurProvider.of(context)?.secondBtnValue;

    final resultValue = intValue == null ? '' : intValue.toString();

    return Text(resultValue);
  }
}

class CounterViewModel extends ChangeNotifier {
  int firstBtnValue;
  int secondBtnValue;

  CounterViewModel({required this.firstBtnValue, required this.secondBtnValue});

  // фабричный конструктор
  factory CounterViewModel.init() {
    return CounterViewModel(firstBtnValue: 0, secondBtnValue: 0);
  }

  void changeFirstBTN() {
    firstBtnValue += 1;
    notifyListeners();
  }

  void changeSecondBTN() {
    secondBtnValue += 1;
    notifyListeners();
  }
}

class OurProvider extends InheritedNotifier<CounterViewModel> {
  final CounterViewModel model;

  const OurProvider({super.key, required this.model, required super.child})
    : super(notifier: model);

  static CounterViewModel? of(BuildContext context) {
    final model = context
        .dependOnInheritedWidgetOfExactType<OurProvider>()
        ?.model;

    return model;
  }
}
