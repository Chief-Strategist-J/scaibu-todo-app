import 'dart:ui';

import 'package:equatable/equatable.dart';

/// Doc Required
sealed class TagEvent extends Equatable {}

/// Doc Required
class InitTagEvent extends TagEvent {
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required
class UpdateColorOfTagEvent extends TagEvent {
  /// Doc Required
  UpdateColorOfTagEvent({required this.color});

  /// Doc Required
  final Color color;

  @override
  List<Object?> get props => <Object?>[color];
}

/// Doc Required
class CreateTagEvent extends TagEvent {
  /// Doc Required
  CreateTagEvent();

  @override
  List<Object?> get props => <Object?>[];
}
