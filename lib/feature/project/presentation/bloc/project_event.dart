import 'package:equatable/equatable.dart';

sealed class ProjectEvent extends Equatable{}

class InitProjectEvent extends ProjectEvent {
  @override
  List<Object?> get props => [];
}