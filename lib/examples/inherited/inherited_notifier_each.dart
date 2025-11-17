import 'package:flutter/material.dart';

final ourmModel = CounterViewModelNew();

class AppExampleInheridEach extends StatelessWidget {
  const AppExampleInheridEach({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: OurProviderNew(
            model: ourmModel,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FistBTNWidgetNewOne(),
                const TextOneNewOne(),
                const SizedBox(height: 20),
                SecondBTNWidgetNewOne(),
                const TextTwoNewOne(),
                const SizedBox(height: 20),
                CountButton(),
                const SizedBox(height: 10),
                ResultWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = OurProviderNew.of(context);

    if (model == null) return SizedBox.expand();

    return Container(
      // Разкоменти и посмотри что будет
      // color: Colors.deepOrangeAccent,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.deepOrangeAccent,
      ),
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder<String>(
        valueListenable: model.result,
        builder: (context, value, child) {
          return Text(value);
        },
      ),
    );
  }
}

class CountButton extends StatelessWidget {
  const CountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: OurProviderNew.of(context)?.contSum,
      child: Text('Расчет'),
    );
  }
}

class FistBTNWidgetNewOne extends StatelessWidget {
  const FistBTNWidgetNewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        OurProviderNew.of(context)?.changeFirstBTN();
      },
      child: Text('Изменить первое значение'),
    );
  }
}

class SecondBTNWidgetNewOne extends StatelessWidget {
  const SecondBTNWidgetNewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        OurProviderNew.of(context)?.changeSecondBTN();
      },
      child: Text('Изменить первое значение'),
    );
  }
}

class TextOneNewOne extends StatelessWidget {
  const TextOneNewOne({super.key});

  @override
  Widget build(BuildContext context) {
    // подписываемся на изменения
    final intValue = OurProviderNew.of(context)?.firstBtn;

    if (intValue == null) return const SizedBox.expand();

    return ValueListenableBuilder<int>(
      valueListenable: intValue,
      builder: (context, value, child) => Text(value.toString()),
    );
  }
}

class TextTwoNewOne extends StatelessWidget {
  const TextTwoNewOne({super.key});

  @override
  Widget build(BuildContext context) {
    // подписываемся на изменения
    final intValue = OurProviderNew.of(context)?.secondBtn;

    if (intValue == null) return const SizedBox.expand();

    return ValueListenableBuilder<int>(
      valueListenable: intValue,
      builder: (context, value, child) => Text(value.toString()),
    );
  }
}

class CounterViewModelNew extends ChangeNotifier {
  final ValueNotifier<int> firstBtn = ValueNotifier<int>(0);
  final ValueNotifier<int> secondBtn = ValueNotifier<int>(0);
  final ValueNotifier<String> result = ValueNotifier<String>('Пусто');

  CounterViewModelNew();

  void changeFirstBTN() {
    firstBtn.value++;
  }

  void changeSecondBTN() => secondBtn.value++;

  void contSum() {
    final first = firstBtn.value;
    final second = secondBtn.value;

    result.value = (first + second).toString();
  }

  @override
  void dispose() {
    firstBtn.dispose();
    secondBtn.dispose();
    super.dispose();
  }
}

class OurProviderNew extends InheritedNotifier<CounterViewModelNew> {
  final CounterViewModelNew model;

  const OurProviderNew({super.key, required this.model, required super.child})
    : super(notifier: model);

  static CounterViewModelNew? of(BuildContext context) {
    final model = context
        .dependOnInheritedWidgetOfExactType<OurProviderNew>()
        ?.model;

    return model;
  }
}
