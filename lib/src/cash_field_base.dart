import 'package:cash_field/src/cubit/cash_cubit.dart';

/// A [CashFieldController] can be used to update the current state of [CashBuilder]
/// and [CashField] widgets.
class CashFieldController extends CashCubit {
  CashFieldController({
    int initialValue = 0,
    int decimalDigits = 2,
  }) : super(
          initialValue: initialValue,
          decimalDigits: decimalDigits,
        );
}
