import 'package:todo_app/core/app_library.dart';

class TagButtonComponent extends StatelessWidget {
  const TagButtonComponent({super.key});

  void _onClose(BuildContext context) {
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            data: 'Cancel',
            variant: CustomButtonVariant.secondary,
            onTap: () async {
              _onClose(context);
            },
          ),
        ),
        Expanded(
          child: CustomButton(
            data: 'Add',
            onTap: () async {
              //
            },
          ),
        ),
      ],
    );
  }
}
