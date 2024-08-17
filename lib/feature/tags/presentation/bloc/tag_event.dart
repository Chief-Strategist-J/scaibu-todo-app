import 'dart:ui';

import 'package:equatable/equatable.dart';

sealed class TagEvent extends Equatable {}

class InitTagEvent extends TagEvent {
  @override
  List<Object?> get props => [];
}

class UpdateColorOfTagEvent extends TagEvent {
  final Color color;

  UpdateColorOfTagEvent({required this.color});

  @override
  List<Object?> get props => [color];
}

class CreateTagEvent extends TagEvent {
  CreateTagEvent();

  @override
  List<Object?> get props => [];
}
