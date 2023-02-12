import 'package:bloc/bloc.dart';
import 'package:cash_field/src/cubit/cash_state.dart';

///
class CashCubit extends Cubit<CashState> {
  /// Create a new [CashCubit] with an optional [initialValue] and
  /// [decimalDigits].
  CashCubit({
    int initialValue = 0,
    int decimalDigits = 2,
  }) : super(CashState(value: initialValue, decimalDigits: decimalDigits));

  /// Add a digit to the end of the current value.
  void addDigit(int digit) {
    if (digit > 9 || digit < 0) {
      throw ArgumentError('Number must be between 0 and 9.');
    }

    final newValue = state.value * 10 + digit;
    emit(state.copyWith(value: newValue));
  }

  /// Remove the last digit from the current value.
  void removeDigit() {
    final newValue = state.value ~/ 10;
    emit(state.copyWith(value: newValue));
  }

  /// Update the current value.
  void updateValue(int value) {
    if (value < 0) {
      throw ArgumentError('Value must be greater than or equal to 0.');
    }

    emit(state.copyWith(value: value));
  }
}
