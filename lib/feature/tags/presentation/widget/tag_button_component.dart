import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TagButtonComponent extends StatelessWidget {
  /// Doc Required
  const TagButtonComponent({
    required this.onTapOfAdd,
    required this.onTapOfCancel,
    super.key,
  });

  /// Doc Required
  final void Function() onTapOfCancel;

  /// Doc Required
  final void Function() onTapOfAdd;

  @override
  Widget build(final BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            child: CustomButton(
              data: 'Cancel',
              variant: CustomButtonVariant.secondary,
              onTap: onTapOfCancel,
            ),
          ),
          Expanded(child: CustomButton(data: 'Add', onTap: onTapOfAdd)),
        ],
      );
}
