import 'package:cash_field/cash_field.dart';

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
