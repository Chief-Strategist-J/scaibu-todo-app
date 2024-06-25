import 'package:todo_app/core/app_library.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: context.width() * 0.3,
          color: context.dividerColor,
          height: 0.5,
        ),
        8.width,
        Text("or", style: primaryTextStyle(size: 12)),
        8.width,
        Container(
          width: context.width() * 0.3,
          color: context.dividerColor,
          height: 0.5,
        ),
      ],
    );
  }
}
