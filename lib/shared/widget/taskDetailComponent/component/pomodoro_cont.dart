import 'package:todo_app/core/app_library.dart';

class PomodoroCont extends StatelessWidget {
  final int _index;
  final Function() onTap;
  final int isSelectedIndex;

  const PomodoroCont({
    super.key,
    required int index,
    required this.onTap,
    required this.isSelectedIndex,
  }) : _index = index;

  @override
  Widget build(BuildContext context) {
    bool _isSelectedCounter = (isSelectedIndex == _index);
    final FontWeight _weight = _isSelectedCounter ? FontWeight.bold : FontWeight.normal;
    final WidgetStateProperty<Color>? _backgroundColor = _isSelectedCounter ? WidgetStateProperty.all<Color>(cardColor) : null;
    final Color? _color = _isSelectedCounter ? white : null;

    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(backgroundColor: _backgroundColor, padding: const WidgetStatePropertyAll(EdgeInsets.zero)),
      child: Text(
        '$_index',
        style: boldTextStyle(
          weight: _weight,
          color: _color,
        ),
      ),
    );
  }
}
