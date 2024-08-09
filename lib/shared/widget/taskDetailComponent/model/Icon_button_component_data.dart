import 'package:todo_app/core/app_library.dart';

class IconButtonComponentData {
  final String _text;
  final String? _prefixText;
  final String _icon;
  final GestureTapCallback? _onTap;

  IconButtonComponentData({
    required String text,
    required String icon,
    String? prefixText,
    void Function()? onTap,
  })  : _onTap = onTap,
        _icon = icon,
        _prefixText = prefixText,
        _text = text;

  String get text => _text;
  String? get prefixText => _prefixText;
  String get icon => _icon;
  GestureTapCallback? get onTap => _onTap;
}
