import 'package:mix/mix.dart';

class BackgroundComponentVariant extends Variant {
  const BackgroundComponentVariant._(super.name);

  static const delete = BackgroundComponentVariant._('custom.delete');
  static const archive = BackgroundComponentVariant._('custom.archive');
}

