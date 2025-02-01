import 'package:todo_app/core/app_library.dart';

/// Doc Required

class CustomCheckboxComponent extends HookWidget {
  /// Doc Required

  const CustomCheckboxComponent({
    required final ValueChanged<bool> onChanged,
    required this.title,
    super.key,
    final CustomCheckboxComponentVariant variant =
        CustomCheckboxComponentVariant.light,
  })  : _onChanged = onChanged,
        _variant = variant;
  final ValueChanged<bool> _onChanged;
  final CustomCheckboxComponentVariant _variant;

  /// Doc Required
  final String title;

  /// Doc Required

  ColorSwatch<int> get getActiveColor {
    final ColorSwatch<int> activeColor;

    if (_variant == CustomCheckboxComponentVariant.light) {
      activeColor = Colors.blueAccent;
    } else {
      activeColor = Colors.blueGrey;
    }
    return activeColor;
  }

  void _onChangeTap(final bool? value, final ValueNotifier<bool> isChecked) {
    if (value != null) {
      isChecked.value = value;
      _onChanged(value); // Callback to parent with the new value
    }
  }

  @override
  Widget build(final BuildContext context) {
    final ValueNotifier<bool> isChecked = useState(false);
    final CustomCheckboxComponentStyle style =
        CustomCheckboxComponentStyle(_variant);

    final ColorSwatch<int> activeColor = getActiveColor;

    return PressableBox(
      style: style.containerStyle(context),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: ListTile(
              title: Text(title, style: style.titleStyle()),
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Expanded(
            child: Checkbox(
              value: isChecked.value,
              shape: const RoundedRectangleBorder(),
              onChanged: (final bool? value) {
                _onChangeTap(value, isChecked);
              },
              activeColor: activeColor,
              checkColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
