
import 'package:todo_app/core/app_library.dart';

class ColorPickerComponent extends HookWidget {
  const ColorPickerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenPickerColor = useState(redColor);

    return ColorPicker(
      color: screenPickerColor.value,
      onColorChanged: (Color color) {
        screenPickerColor.value = color;
      },
      width: 44,
      height: 44,
      borderRadius: 22,
      enableOpacity: true,
      colorCodeHasColor: true,
      enableShadesSelection: true,
      showRecentColors: true,
      showColorCode: true,
      showColorName: true,
      columnSpacing: 16,
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.customSecondary: true,
        ColorPickerType.wheel: true,
      },
      heading: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text('Select color', style: Theme.of(context).textTheme.titleMedium),
          ),
        ],
      ),
      subheading: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text('Select color shade', style: Theme.of(context).textTheme.titleSmall),
          ),
        ],
      ),
    );
  }
}
