import 'package:equatable/equatable.dart';

sealed class TagEvent extends Equatable {}

class InitTagEvent extends TagEvent {

  @override
  List<Object?> get props => [];
}
