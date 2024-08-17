import 'dart:ui';

import 'package:equatable/equatable.dart';

sealed class TagState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TagDataState extends TagState {
  final Color? color;

  TagDataState({this.color});

  factory TagDataState.init() {
    return TagDataState();
  }

  TagDataState copyWith({Color? color}) {
    return TagDataState(
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props => [color];
}
