import 'package:todo_app/core/app_library.dart';

/// Doc Required

sealed class ProjectEvent extends Equatable {}

/// Doc Required

class InitProjectEvent extends ProjectEvent {
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required

class CreateProjectEvent extends ProjectEvent {
  /// Doc Required

  CreateProjectEvent({required this.request});

  /// Doc Required
  final ProjectPageParam request;

  @override
  List<Object?> get props => <Object?>[request];
}
