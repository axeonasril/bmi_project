import 'package:bmi_project/helpers/bmi_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  BmiCalculator calculator = BmiCalculator(height: 100, weight: 50);

  group("Obese Test", () {
    test("Test bmi calculator: obese category calculation", () {
      final result = calculator.calculateBmi();
      expect(result, 50);
    });

    test("Test bmi calculator: obese category text", () {
      final result = calculator.determineBmiCategory();
      expect(result, contains("Obese"));
    });
    test("Test bmi calculator: obese health description", () {
      final result = calculator.getHealthRiskDescription();
      expect(result, contains("Metabolic Syndrome"));
    });
  });
  group("Normal Test", () {
    test("Test bmi calculator: normal category calculation", () {
      calculator.height = 150;
      calculator.weight = 45;
      final result = calculator.calculateBmi();
      expect(result, 20);
    });

    test("Test bmi calculator: normal category text", () {
      final result = calculator.determineBmiCategory();
      expect(result, contains("Normal"));
    });
    test("Test bmi calculator: normal health description", () {
      final result = calculator.getHealthRiskDescription();
      expect(result, contains("healthy range"));
    });
  });

  group("Normal Test dengan hasil desimal", () {
    test("Test bmi calculator: normal category calculation", () {
      calculator.height = 150;
      calculator.weight = 50;
      final result = calculator.calculateBmi();
      final convertedResult = result.toStringAsFixed(1);
      expect(convertedResult, "22.2");
    });

    test("Test bmi calculator: normal category text", () {
      final result = calculator.determineBmiCategory();
      expect(result, contains("Normal"));
    });
    test("Test bmi calculator: normal health description", () {
      final result = calculator.getHealthRiskDescription();
      expect(result, contains("healthy range"));
    });
  });
}
