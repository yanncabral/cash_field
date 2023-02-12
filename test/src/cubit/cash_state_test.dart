import 'package:cash_field/src/cubit/cash_state.dart';
import 'package:test/test.dart';

void main() {
  group("CashState", () {
    test("initial state is correct", () {
      final state = CashState(value: 0);
      expect(state.value, 0);
      expect(state.decimalDigits, 2);
      expect(state.symbol, '\$');
    });

    test("valueAsDouble is correct", () {
      final state = CashState(value: 100);
      expect(state.valueAsDouble, 1.0);
    });

    test("valueAsDouble is correct with decimal digits", () {
      final state = CashState(value: 100, decimalDigits: 3);
      expect(state.valueAsDouble, 0.1);
    });

    test("valueAsDouble is correct with symbol", () {
      final state = CashState(value: 100, symbol: '€');
      expect(state.valueAsDouble, 1.0);
    });

    test("valueAsDouble is correct with decimal digits and symbol", () {
      final state = CashState(value: 100, decimalDigits: 3, symbol: '€');
      expect(state.valueAsDouble, 0.1);
    });

    test("valueAsString is correct", () {
      final state = CashState(value: 100);
      expect(state.display, '\$1.00');
    });
  });
}
