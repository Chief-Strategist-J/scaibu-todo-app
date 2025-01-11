import 'package:equatable/equatable.dart';
import 'package:todo_app/feature/post/domain/entity/post_entity.dart';

sealed class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitPostState extends PostState {}

class PostLoadingState extends PostState {
  PostLoadingState({this.isInitialLoad = false});
  final bool isInitialLoad;

  @override
  List<Object?> get props => [isInitialLoad];
}

class PostDataState extends PostState {
  PostDataState({
    this.posts = const [],
    this.hasError = false,
    this.errorMessage,
    this.isEmpty = false,
  });

  final List<PostEntity> posts;
  final bool hasError;
  final String? errorMessage;
  final bool isEmpty;

  @override
  List<Object?> get props => [posts, hasError, errorMessage, isEmpty];
}

class PostErrorState extends PostState {
  PostErrorState(this.errorMessage);

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

class PostEmptyState extends PostState {}

class PostOperationState extends PostState {
  PostOperationState({
    this.isProcessing = true,
    this.operationMessage,
  });

  final bool isProcessing;
  final String? operationMessage;

  @override
  List<Object?> get props => [isProcessing, operationMessage];
}
