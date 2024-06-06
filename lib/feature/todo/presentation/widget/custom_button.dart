import 'package:todo_app/core/todo_library.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback? _onTap;
  final String? _data;

  const CustomButton({
    super.key,
    void Function()? onTap,
    String? data,
  })  : _data = data,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 56,
        alignment: Alignment.center,
        decoration: boxDecorationWithRoundedCorners(
          backgroundColor: context.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(_data ?? '', style: boldTextStyle(color: context.primaryColor)),
      ),
    );
  }
}
