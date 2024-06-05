import 'package:todo_app/core/todo_library.dart';

TimeService _timeService = TimeService();

class ContentWidget extends StatelessWidget {
  final bool isTimeField;
  final bool isDateField;

  final String title;

  final TextEditingController controller;

  final TextFieldType textFieldType;

  final FocusNode? focusNode;

  final TextInputAction? textInputAction;

  final GestureTapCallback? onTap;

  const ContentWidget({
    super.key,
    required this.title,
    required this.controller,
    this.focusNode,
    this.textInputAction,
    this.isTimeField = false,
    this.isDateField = false,
    this.onTap,
    this.textFieldType = TextFieldType.NAME,
  });

  bool get isEnabled => !((isTimeField) || (isDateField));

  Future<void> onTapOfInputField(BuildContext context) async {
    if (onTap != null) onTap!.call();

    if (isTimeField) {
      controller.text = await _timeService.pickTime(context);
    } else if (isDateField) {
      controller.text = await _timeService.selectDate(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        Text(title, style: TextStyle(color: gray, fontSize: 14, fontWeight: FontWeight.w500)),
        GestureDetector(
          onTap: () async {
            await onTapOfInputField(context);
          },
          child: AppTextField(
            controller: controller,
            focus: focusNode,
            enabled: isEnabled,
            textInputAction: textInputAction ?? TextInputAction.next,
            textFieldType: textFieldType,
          ),
        ),
      ],
    );
  }
}
