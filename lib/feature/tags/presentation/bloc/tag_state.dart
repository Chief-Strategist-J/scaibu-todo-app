import 'dart:ui';

import 'package:equatable/equatable.dart';

/// Doc Required
sealed class TagState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required
class TagDataState extends TagState {
  /// Doc Required
  TagDataState({this.color});

  /// Doc Required
  factory TagDataState.init() => TagDataState();

  /// Doc Required
  final Color? color;

  /// Doc Required
  TagDataState copyWith({final Color? color}) => TagDataState(
        color: color ?? this.color,
    );

  @override
  List<Object?> get props => <Object?>[color];
}
