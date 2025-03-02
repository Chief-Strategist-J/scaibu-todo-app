import 'package:todo_app/core/app_library.dart';

/// Defines the styling for a custom button, including its variant.
class CustomButtonStyle {
  /// Creates a button style with the specified variant.
  CustomButtonStyle({required this.variant});

  /// Public variable representing the variant type for the custom button.
  final CustomButtonVariant variant;

  /// Returns the button style based on the current build context.
  Style button(final BuildContext context) => Style(
        $box.padding.all(8),
        $box.margin.horizontal(8),
        $box.height(52),
        $box.alignment.center(),
        CustomButtonVariant.primary(
          $box.decoration.color(context.cardColor),
          $text.style.color(context.primaryColor),
        ),
        CustomButtonVariant.secondary(
          $box.decoration.color(context.primaryColor),
          $text.style.color(context.cardColor),
          $box.decoration.border.all(
            color: context.cardColor.withValues(
              alpha: 0.5,
            ),
          ),
        ),
        $box.decoration.borderRadius.circular(300),
        $text.style.fontWeight.bold(),
        $text.style.fontSize(16),
      ).applyVariants(<Variant>[variant]);
}
