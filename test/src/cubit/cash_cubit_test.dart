import 'package:cash_field/src/cubit/cash_cubit.dart';
import 'package:cash_field/src/cubit/cash_state.dart';
import 'package:test/test.dart';

void main() {
  group("CashCubit", () {
    test("initial state is correct", () {
      final cubit = CashCubit();
      expect(cubit.state, CashState(value: 0));
      cubit.close();
    });

    test("initial state is correct with initial value", () {
      final cubit = CashCubit(initialValue: 100);
      expect(cubit.state, CashState(value: 100));
      cubit.close();
    });

    test("initial state is correct with decimal digits", () {
      final cubit = CashCubit(decimalDigits: 3);
      expect(cubit.state, CashState(value: 0, decimalDigits: 3));
      cubit.close();
    });

    test("initial state is correct with initial value and decimal digits", () {
      final cubit = CashCubit(initialValue: 100, decimalDigits: 3);
      expect(cubit.state, CashState(value: 100, decimalDigits: 3));
      cubit.close();
    });

    test("addDigit adds a digit to the end of the current value", () {
      final cubit = CashCubit();
      cubit.addDigit(1);
      expect(cubit.state, CashState(value: 1));
      cubit.addDigit(2);
      expect(cubit.state, CashState(value: 12));
      cubit.addDigit(3);
      expect(cubit.state, CashState(value: 123));
      cubit.close();
    });

    test("addDigit throws an error if the digit is not between 0 and 9", () {
      final cubit = CashCubit();
      expect(() => cubit.addDigit(10), throwsArgumentError);
      expect(() => cubit.addDigit(-1), throwsArgumentError);
      cubit.close();
    });

    test("removeDigit removes the last digit from the current value", () {
      final cubit = CashCubit();
      cubit.addDigit(1);
      cubit.addDigit(2);
      cubit.addDigit(3);
      expect(cubit.state, CashState(value: 123));
      cubit.removeDigit();
      expect(cubit.state, CashState(value: 12));
      cubit.removeDigit();
      expect(cubit.state, CashState(value: 1));
      cubit.removeDigit();
      expect(cubit.state, CashState(value: 0));
      cubit.close();
    });

    test("removeDigit does nothing if the current value is 0", () {
      final cubit = CashCubit();
      cubit.removeDigit();
      expect(cubit.state, CashState(value: 0));
      cubit.close();
    });

    test("addDigit and removeDigit work together", () {
      final cubit = CashCubit();
      cubit.addDigit(1);
      cubit.addDigit(2);
      cubit.addDigit(3);
      cubit.removeDigit();
      expect(cubit.state, CashState(value: 12));
      cubit.addDigit(3);
      expect(cubit.state, CashState(value: 123));
      cubit.removeDigit();
      cubit.removeDigit();
      expect(cubit.state, CashState(value: 1));
      cubit.close();
    });
  });
}
