import 'package:todo_app/core/app_library.dart';

class CustomCheckboxComponent extends HookWidget {
  final ValueChanged<bool> _onChanged;
  final CustomCheckboxComponentVariant _variant;
  final String title;

  const CustomCheckboxComponent({
    super.key,
    required void Function(bool) onChanged,
    CustomCheckboxComponentVariant variant = CustomCheckboxComponentVariant.light,
    required this.title,
  })  : _onChanged = onChanged,
        _variant = variant;

  ColorSwatch<int> get getActiveColor {
    final ColorSwatch<int> _activeColor;

    if (_variant == CustomCheckboxComponentVariant.light) {
      _activeColor = Colors.blueAccent;
    } else {
      _activeColor = Colors.blueGrey;
    }
    return _activeColor;
  }

  void _onChangeTap(bool? value, ValueNotifier<bool> _isChecked) {
    if (value != null) {
      _isChecked.value = value;
      _onChanged(value); // Callback to parent with the new value
    }
  }

  @override
  Widget build(BuildContext context) {
    final _isChecked = useState(false);
    final _style = CustomCheckboxComponentStyle(_variant);

    ColorSwatch<int> _activeColor = getActiveColor;

    return PressableBox(
      style: _style.containerStyle(context),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: ListTile(
              title: Text(title, style: _style.titleStyle()),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              visualDensity: const VisualDensity(vertical: -4),
            ),
          ),
          Expanded(
            child: Checkbox(
              value: _isChecked.value,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              onChanged: (value) {
                _onChangeTap(value, _isChecked);
              },
              activeColor: _activeColor,
              checkColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
