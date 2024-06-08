import 'package:todo_app/core/todo_library.dart';

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
  })  : _onTap = onTap,
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
      _controller.text = await timeService.pickTime(context);
    } else if (_isDateField) {
      _controller.text = await timeService.selectDate(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        Text(_title, style: const TextStyle(color: gray, fontSize: 14, fontWeight: FontWeight.w500)),
        GestureDetector(
          onTap: () async {
            await _onTapOfInputField(context);
          },
          child: AppTextField(
            controller: _controller,
            focus: _focusNode,
            enabled: _isEnabled,
            textInputAction: _textInputAction ?? TextInputAction.next,
            textFieldType: _textFieldType,
          ),
        ),
      ],
    );
  }
}
