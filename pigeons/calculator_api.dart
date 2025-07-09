import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/calculator_api.dart',
  dartOptions: DartOptions(),
  swiftOut: 'ios/Runner/CalculatorApi.swift',
  swiftOptions: SwiftOptions(),
  kotlinOut: 'android/app/src/main/kotlin/com/example/calculator_native/CalculatorApi.kt',
  kotlinOptions: KotlinOptions(
    package: 'com.example.calculator_native',
  ),
))

@HostApi()
abstract class CalculatorApi {
  double add(double a, double b);
  double subtract(double a, double b);
  double multiply(double a, double b);
  double divide(double a, double b);
}
