import 'package:equatable/equatable.dart';

sealed class ProjectEvent extends Equatable {}

class InitProjectEvent extends ProjectEvent {
  @override
  List<Object?> get props => [];
}

class CreateProjectEvent extends ProjectEvent {
  final Map<String, dynamic> request;

  CreateProjectEvent({required this.request});

  @override
  List<Object?> get props => [request];
}
