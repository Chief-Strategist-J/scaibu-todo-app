import 'package:todo_app/core/app_library.dart';

TimeService timeService = getIt<TimeService>();

class ContentWidget extends StatelessWidget {
  final bool _isTimeField;
  final bool _isDateField;

  final String _title;

  final TextEditingController _controller;

  final TextFieldType _textFieldType;

  final FocusNode? _focusNode;

  final TextInputAction? _textInputAction;

  final GestureTapCallback? _onTap;
  final void Function(TimeServiceModel)? _onSelectOfDateOrTime;

  const ContentWidget({
    super.key,
    required String title,
    required TextEditingController controller,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    bool isTimeField = false,
    bool isDateField = false,
    void Function()? onTap,
    TextFieldType textFieldType = TextFieldType.OTHER,
    void Function(TimeServiceModel)? onSelectOfDateOrTime,
  })  : _onSelectOfDateOrTime = onSelectOfDateOrTime,
        _onTap = onTap,
        _textInputAction = textInputAction,
        _focusNode = focusNode,
        _textFieldType = textFieldType,
        _controller = controller,
        _title = title,
        _isDateField = isDateField,
        _isTimeField = isTimeField;

  bool get _isEnabled => !((_isTimeField) || (_isDateField));

  Future<void> _onTapOfInputField(BuildContext context) async {
    if (_onTap != null) _onTap?.call();

    if (FocusScope.of(context).hasFocus) hideKeyboard(context);

    if (_isTimeField) {
      final TimeServiceModel time = await timeService.selectTime(context);
      _controller.text = time.formatTimeInString;

      if (_onSelectOfDateOrTime != null) {
        _onSelectOfDateOrTime?.call(time);
      }
    } else if (_isDateField) {
      final TimeServiceModel time = await timeService.selectDate(context);
      _controller.text = time.formatTimeInString;

      if (_onSelectOfDateOrTime != null) {
        _onSelectOfDateOrTime?.call(time);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        Text(_title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        4.height,
        GestureDetector(
          onTap: () async {
            await _onTapOfInputField(context);
          },
          child: AppTextField(
            controller: _controller,
            focus: _focusNode,
            enabled: _isEnabled,
            validator: (value) {
              if (value == null) return "Can't Null";
              if (value.isEmpty) return "Can't Empty";
              return null;
            },
            textInputAction: _textInputAction ?? TextInputAction.next,
            textFieldType: _textFieldType,
          ),
        ),
      ],
    );
  }
}
