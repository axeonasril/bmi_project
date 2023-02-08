
// ignore_for_file: unused_import

import 'package:bmi_project/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("BMI Data Screen Test Widget", (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(1200, 2200);
    await tester.pumpWidget(const DataScreenTest());

    final findMaleIcon = find.byIcon(Icons.male);
    final findFemaleText = find.text("FEMALE");
    final findCheckIcon = find.byIcon(Icons.check_circle);

    expect(findMaleIcon, findsOneWidget);
    expect(findFemaleText, findsOneWidget);
    expect(findCheckIcon, findsNWidgets(2));

    final findHitung = find.text("CALCULATE YOUR BMI");
    expect(findHitung, findsOneWidget);
    await tester.tap(findHitung);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(findMaleIcon, findsNothing);
  });
}

class DataScreenTest extends StatelessWidget {
  const DataScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BmiDataScreen(),
    );
  }
}
