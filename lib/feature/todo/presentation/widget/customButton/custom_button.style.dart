// child: Container(
//         padding: const EdgeInsets.all(16),
//         margin: const EdgeInsets.symmetric(horizontal: 16),
//         height: 56,
//         alignment: Alignment.center,
//         decoration: boxDecorationWithRoundedCorners(
//           backgroundColor: context.cardColor,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Text(_data ?? '', style: boldTextStyle(color: context.primaryColor)),
//       ),

import 'package:todo_app/core/todo_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/customButton/custom_button.variant.dart';

class CustomButtonStyle {
  final CustomButtonVariant variant;

  CustomButtonStyle({required this.variant});

  Style button(BuildContext context) {
    return Style(
      $box.padding.all(16),
      $box.margin.horizontal(16),
      $box.height(56),
      $box.alignment.center(),
      $box.decoration.color(context.cardColor),
      $box.decoration.borderRadius.circular(16),
      $text.style.color(context.primaryColor),
      $text.style.fontWeight.bold(),
      $text.style.fontSize(16),
    );
  }
}
