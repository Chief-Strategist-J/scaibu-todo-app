import 'package:equatable/equatable.dart';

sealed class PostEvent extends Equatable{}

class InitPostEvent extends PostEvent {
  @override
  List<Object?> get props => [];
}