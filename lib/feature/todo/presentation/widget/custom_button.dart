import 'package:todo_app/core/todo_library.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? data;


  const CustomButton({super.key, this.onTap, this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 56,
        alignment: Alignment.center,
        decoration: boxDecorationWithRoundedCorners(
          backgroundColor: context.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(data ?? '',style: boldTextStyle(color: context.primaryColor)),
      ),
    );
  }
}
