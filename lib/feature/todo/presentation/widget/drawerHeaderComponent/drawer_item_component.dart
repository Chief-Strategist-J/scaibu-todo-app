import 'package:todo_app/core/app_library.dart';

/// Doc Required
class DrawerItemComponent extends StatelessWidget {
  /// Doc Required
  const DrawerItemComponent({
    required final String title,
    required final void Function() onTap,
    super.key,
  })  : _onTap = onTap,
        _title = title;

  final String _title;
  final void Function() _onTap;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Divider(thickness: 0.5),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _onTap,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Text(_title, style: boldTextStyle()),
            ),
          ),
        ],
      );
}
