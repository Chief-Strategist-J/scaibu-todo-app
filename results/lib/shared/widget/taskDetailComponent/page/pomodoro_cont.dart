import 'package:todo_app/core/app_library.dart';

/// Doc Required
class PomodoroCont extends StatelessWidget {
  /// Doc Required
  const PomodoroCont({
    required final int index,
    required final void Function() onTap,
    required final int isSelectedIndex,
    super.key,
  })  : _onTap = onTap,
        _isSelectedIndex = isSelectedIndex,
        _index = index;

  final int _index;
  final void Function() _onTap;
  final int _isSelectedIndex;

  @override
  Widget build(final BuildContext context) {
    final bool isSelectedCounter = (_isSelectedIndex == _index);
    final FontWeight weight =
        isSelectedCounter ? FontWeight.bold : FontWeight.normal;
    final WidgetStateProperty<Color>? backgroundColor =
        isSelectedCounter ? WidgetStateProperty.all<Color>(cardColor) : null;
    final Color? color = isSelectedCounter ? white : null;

    return TextButton(
      onPressed: _onTap,
      style: ButtonStyle(
        backgroundColor: backgroundColor,
        padding: const WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
      ),
      child: Text(
        '$_index',
        style: boldTextStyle(
          weight: weight,
          color: color,
        ),
      ),
    );
  }
}
