import 'package:flutter/material.dart';

class AppExample extends StatefulWidget {
  const AppExample({super.key});

  @override
  State<AppExample> createState() => _AppExampleState();
}

class _AppExampleState extends State<AppExample> {
  int ourValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: OurInheridWidget(
            countValue: ourValue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ourValue += 1;
                    setState(() {});
                  },
                  child: Text('Жми'),
                ),
                const TextOne(),
                const TextTwo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextOne extends StatelessWidget {
  const TextOne({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context
        .dependOnInheritedWidgetOfExactType<OurInheridWidget>(aspect: 'textOne')
        ?.countValue
        .toString();

    return Text(value ?? '');
  }
}

class TextTwo extends StatelessWidget {
  const TextTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context
        .dependOnInheritedWidgetOfExactType<OurInheridWidget>(aspect: "TextTwo")
        ?.countValue
        .toString();
    return Text(value ?? "");
  }
}

class OurInheridWidget extends InheritedModel<String> {
  final int countValue;

  const OurInheridWidget({
    super.key,
    required this.countValue,
    required super.child,
  });

  @override
  bool updateShouldNotify(OurInheridWidget oldWidget) {
    return countValue != oldWidget.countValue;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant OurInheridWidget oldWidget,
    Set<String> aspect,
  ) {
    return countValue != oldWidget.countValue && aspect.contains('TextTwo');
  }
}
