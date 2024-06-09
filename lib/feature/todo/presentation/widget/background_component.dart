import 'package:todo_app/core/todo_library.dart';

class BackgroundComponent extends StatelessWidget {
  final Color backgroundColor;
  final IconData? icon;
  final MainAxisAlignment mainAxisAlignment;

  const BackgroundComponent({
    super.key,
    this.icon,
    this.backgroundColor = whiteColor,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.white),
      child: Container(
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: BorderRadius.circular(23),
          backgroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (mainAxisAlignment == MainAxisAlignment.start) 16.width,
            Icon(icon, color: context.primaryColor),
            if (mainAxisAlignment == MainAxisAlignment.end) 16.width,
          ],
        ),
      ),
    );
  }
}
