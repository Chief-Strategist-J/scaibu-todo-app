import 'package:equatable/equatable.dart';
import 'package:todo_app/feature/post/domain/entity/post_entity.dart';

sealed class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitPostState extends PostState {}

class PostLoadingState extends PostState {
  final bool isInitialLoad;

  PostLoadingState({this.isInitialLoad = false});

  @override
  List<Object?> get props => [isInitialLoad];
}

class PostDataState extends PostState {
  final List<PostEntity> posts;
  final bool hasError;
  final String? errorMessage;
  final bool isEmpty;

  PostDataState({
    this.posts = const [],
    this.hasError = false,
    this.errorMessage,
    this.isEmpty = false,
  });

  @override
  List<Object?> get props => [posts, hasError, errorMessage, isEmpty];
}

class PostErrorState extends PostState {
  final String errorMessage;

  PostErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class PostEmptyState extends PostState {}

class PostOperationState extends PostState {
  final bool isProcessing;
  final String? operationMessage;

  PostOperationState({
    this.isProcessing = true,
    this.operationMessage,
  });

  @override
  List<Object?> get props => [isProcessing, operationMessage];
}
