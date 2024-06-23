import 'package:todo_app/core/app_library.dart';

class BackgroundComponentStyle {
  final BackgroundComponentVariant variant;

  BackgroundComponentStyle(this.variant);

  Style container(BuildContext context) {
    return Style(
      $box.padding.all(16),
      $box.margin.horizontal(16),
      $box.height(56),
      $box.alignment.center(),
      BackgroundComponentVariant.archive($box.decoration.color(Colors.green)),
      BackgroundComponentVariant.delete($box.decoration.color(redColor)),
      $box.decoration.borderRadius.circular(16),
    ).applyVariants([variant]);
  }

  Style rawAlignment(BuildContext context) {
    return Style(
      BackgroundComponentVariant.delete($flex.mainAxisAlignment.end()),
      BackgroundComponentVariant.archive($flex.mainAxisAlignment.start()),
    ).applyVariants([variant]);
  }
}
