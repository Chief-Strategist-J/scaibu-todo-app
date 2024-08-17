import 'package:todo_app/core/app_library.dart';

class TagButtonComponent extends StatelessWidget {
  final void Function() onTapOfCancel;
  final void Function() onTapOfAdd;

  const TagButtonComponent({super.key, required this.onTapOfAdd, required this.onTapOfCancel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomButton(data: 'Cancel', variant: CustomButtonVariant.secondary, onTap: onTapOfCancel)),
        Expanded(child: CustomButton(data: 'Add', onTap: onTapOfAdd)),
      ],
    );
  }
}
