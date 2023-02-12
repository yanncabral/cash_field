import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

/// The current state of the [CashCubit].
class CashState extends Equatable {
  const CashState({
    required this.value,
    this.decimalDigits = 2,
    this.symbol = '\$',
  });

  final int value;
  final int decimalDigits;
  final String symbol;

  double get valueAsDouble => value / decimalDigits;

  String get display => NumberFormat.simpleCurrency(
        decimalDigits: decimalDigits,
        name: symbol,
      ).format(valueAsDouble);

  CashState copyWith({required int value}) {
    return CashState(
      value: value,
    );
  }

  @override
  List<Object?> get props => [value, decimalDigits, symbol];
}
