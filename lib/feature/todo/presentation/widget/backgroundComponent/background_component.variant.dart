import 'package:mix/mix.dart';

/// A class that defines different variants for the background component.
/// It extends from [Variant] to represent customizable background styles.
class BackgroundComponentVariant extends Variant {
  /// Private constructor that takes a name to initialize the variant.
  ///
  /// The [name] is used to distinguish between different variants.
  const BackgroundComponentVariant._(super.name);

  /// A variant for the "delete" style, used to represent a background component
  /// with a deletion theme.
  static const BackgroundComponentVariant delete =
      BackgroundComponentVariant._('custom.delete');

  /// A variant for the "archive" style, used to represent a
  /// background component
  /// with an archive theme.
  static const BackgroundComponentVariant archive =
      BackgroundComponentVariant._('custom.archive');
}
