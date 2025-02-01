import 'package:todo_app/core/app_library.dart';

sealed class ProjectEvent extends Equatable {}

class InitProjectEvent extends ProjectEvent {
  @override
  List<Object?> get props => [];
}

class CreateProjectEvent extends ProjectEvent {
  final ProjectPageParam request;

  CreateProjectEvent({required this.request});

  @override
  List<Object?> get props => [request];
}
