import 'package:equatable/equatable.dart';
import 'package:todo_app/feature/post/domain/entity/post_entity.dart';

/// Doc Required
sealed class PostState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required
class InitPostState extends PostState {}

/// Doc Required
class PostLoadingState extends PostState {
  /// Doc Required
  PostLoadingState({this.isInitialLoad = false});

  /// Doc Required
  final bool isInitialLoad;

  @override
  List<Object?> get props => <Object?>[isInitialLoad];
}

/// Doc Required
class PostDataState extends PostState {
  /// Doc Required
  PostDataState({
    this.posts = const <PostEntity>[],
    this.hasError = false,
    this.errorMessage,
    this.isEmpty = false,
  });

  /// Doc Required
  final List<PostEntity> posts;

  /// Doc Required
  final bool hasError;

  /// Doc Required
  final String? errorMessage;

  /// Doc Required
  final bool isEmpty;

  @override
  List<Object?> get props => <Object?>[posts, hasError, errorMessage, isEmpty];
}

/// Doc Required
class PostErrorState extends PostState {
  /// Doc Required
  PostErrorState(this.errorMessage);

  /// Doc Required
  final String errorMessage;

  @override
  List<Object?> get props => <Object?>[errorMessage];
}

/// Doc Required
class PostEmptyState extends PostState {}

/// Doc Required
class PostOperationState extends PostState {
  /// Doc Required
  PostOperationState({
    this.isProcessing = true,
    this.operationMessage,
  });

  /// Doc Required
  final bool isProcessing;

  /// Doc Required
  final String? operationMessage;

  @override
  List<Object?> get props => <Object?>[isProcessing, operationMessage];
}
