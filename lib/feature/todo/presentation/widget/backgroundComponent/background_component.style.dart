import 'package:todo_app/core/app_library.dart';

/// A class that defines the style for a background component
/// based on its variant.
class BackgroundComponentStyle {
  /// Creates a new instance of [BackgroundComponentStyle]
  /// with the specified [variant].
  ///
  /// The [variant] determines the specific style of the background component.
  BackgroundComponentStyle(this.variant);

  /// The variant that defines the specific style to be applied.
  final BackgroundComponentVariant variant;

  /// Returns the style for the container based
  /// on the background component's variant.
  /// This method applies padding, margin, height, alignment,
  /// and background color,
  /// as well as a rounded border based on the selected variant.
  Style container(final BuildContext context) => Style(
        $box.padding.all(16), // Adds padding around the container
        $box.margin.horizontal(16), // Adds horizontal margin
        $box.height(56), // Sets the height of the container
        $box.alignment.center(), // Centers the content in the container
        // Applies background color based on the variant
        BackgroundComponentVariant.archive($box.decoration.color(colorGreen)),
        BackgroundComponentVariant.delete($box.decoration.color(redColor)),
        $box.decoration.borderRadius
            .circular(16), // Rounded corners for the container
      ).applyVariants(<Variant>[variant]); // Applies the selected variant style

  /// Returns the style for aligning content within the background component.
  ///
  /// This method sets the main axis alignment for the content
  /// based on the variant,
  /// aligning it to the start or end of the container.
  Style rawAlignment(final BuildContext context) => Style(
        BackgroundComponentVariant.delete(
          $flex.mainAxisAlignment.end(),
        ), // Aligns to the end for 'delete' variant
        BackgroundComponentVariant.archive(
          $flex.mainAxisAlignment.start(),
        ), // Aligns to the start for 'archive' variant
      ).applyVariants(
        <Variant>[variant],
      ); // Applies the selected variant alignment
}
