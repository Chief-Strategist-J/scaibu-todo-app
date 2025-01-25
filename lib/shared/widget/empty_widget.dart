import 'package:todo_app/core/app_library.dart';

/// Doc Required
class EmptyWidget extends StatelessWidget {
  /// Doc Required
  const EmptyWidget({required this.msg, super.key});

  /// Doc Required
  final String msg;

  @override
  Widget build(final BuildContext context) => Center(child: Text(msg));
}
