<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Cash Field

A package that aims to help you handling cash value input with `addDigit` and `removeDigit`. It's also part of a blog series on my personal blog about how to create and publish pub.dev packages. See more on [my website](yanncabral.com.br).

## Getting started

Install cash_field with pub using

```bash
flutter pub add cash_field
```

or just add to your pubspec.yaml

```bash
dependencies:
    cash_field: ^0.0.1
```

## Usage

```dart
void main() {
  // Create a controller
  final controller = CashFieldController();

  // Add a digit when the user taps a number button
  controller.addDigit(1);

  // Remove a digit when the user taps the backspace button
  controller.removeDigit();

  // Get the current value
  final value = controller.state.value;

  // Get the current value as a double
  final valueAsDouble = controller.state.valueAsDouble;

  // Get the current value as a string
  final valueAsString = controller.state.display;

  // Get the current decimal digits
  final decimalDigits = controller.state.decimalDigits;

  // Get the current symbol
  final symbol = controller.state.symbol;

  // Update the value when the user taps the clear button
  controller.updateValue(0);

  // Print the current state
  print(
    'value: $value, valueAsDouble: $valueAsDouble, valueAsString: $valueAsString, decimalDigits: $decimalDigits, symbol: $symbol',
  );
}
```
