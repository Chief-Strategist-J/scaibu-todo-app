import 'package:todo_app/core/app_library.dart';

class DrawerItemComponent extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const DrawerItemComponent({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Divider(thickness: 0.5),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Text(title, style: boldTextStyle()),
            ),
          )
        ],
      );
}
