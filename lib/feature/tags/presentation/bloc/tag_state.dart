import 'package:equatable/equatable.dart';

sealed class TagState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TagDataState extends TagState {
  TagDataState();

  factory TagDataState.init() {
    return TagDataState();
  }

  TagDataState copyWith() {
    return TagDataState();
  }

  @override
  List<Object?> get props => [];
}
