import 'package:todo_app/core/app_library.dart';

TimeService timeService = getIt<TimeService>();

class ContentWidget extends StatelessWidget {
  final bool _isTimeField;
  final bool _isDateField;

  final int? _lines;

  final String _title;

  final TextEditingController _controller;

  final TextFieldType _textFieldType;

  final FocusNode? _focusNode;

  final TextInputAction? _textInputAction;

  final GestureTapCallback? _onTap;
  final void Function(TimeServiceModel)? _onSelectOfDateOrTime;

  final Widget? _prefixIcon;

  const ContentWidget({
    required final String title,
    required final TextEditingController controller,
    super.key,
    final FocusNode? focusNode,
    final TextInputAction? textInputAction,
    final bool isTimeField = false,
    final bool isDateField = false,
    final void Function()? onTap,
    final TextFieldType textFieldType = TextFieldType.OTHER,
    final void Function(TimeServiceModel)? onSelectOfDateOrTime,
    final int? lines,
    final Widget? prefixIcon,
  })  : _prefixIcon = prefixIcon,
        _lines = lines,
        _onSelectOfDateOrTime = onSelectOfDateOrTime,
        _onTap = onTap,
        _textInputAction = textInputAction,
        _focusNode = focusNode,
        _textFieldType = textFieldType,
        _controller = controller,
        _title = title,
        _isDateField = isDateField,
        _isTimeField = isTimeField;

  bool get _isEnabled => !((_isTimeField) || (_isDateField));

  Future<void> _onTapOfInputField(final BuildContext context) async {
    if (_onTap != null) {
      _onTap?.call();
      return;
    }

    if (FocusScope.of(context).hasFocus) {
      hideKeyboard(context);
    }

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
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          16.height,
          Text(_title,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          4.height,
          GestureDetector(
            onTap: () async {
              if (!isInternetConnected) {
                return;
              }
              await _onTapOfInputField(context);
            },
            child: AppTextField(
              controller: _controller,
              focus: _focusNode,
              enabled: _isEnabled,
              maxLines: _lines,
              minLines: _lines,
              readOnly: !isInternetConnected,
              textStyle:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                prefixIcon: _prefixIcon,
                errorStyle: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: redColor,
                ),
              ),
              validator: (final String? value) {
                if (value == null) {
                  return "This Field Can't Be Null";
                }
                if (value.isEmpty) {
                  return "This Field Can't Be Empty";
                }
                return null;
              },
              textInputAction: _textInputAction ?? TextInputAction.next,
              textFieldType: _textFieldType,
            ),
          ),
        ],
      );
}
