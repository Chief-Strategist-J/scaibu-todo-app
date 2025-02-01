import 'package:equatable/equatable.dart';
import 'package:todo_app/feature/comment/domain/entity/comment_entity.dart';

sealed class CommentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitCommentState extends CommentState {}

class CommentEmptyState extends CommentState {}

class CommentLoadingState extends CommentState {
  final bool isInitialLoad;

  CommentLoadingState({this.isInitialLoad = false});

  @override
  List<Object?> get props => [isInitialLoad];
}

class CommentErrorState extends CommentState {
  final String errorMessage;

  CommentErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class CommentOperationState extends CommentState {
  final bool isProcessing;
  final String? operationMessage;

  CommentOperationState({this.isProcessing = true, this.operationMessage});

  @override
  List<Object?> get props => [isProcessing, operationMessage];
}

class CommentDataState extends CommentState {
  final List<CommentEntity> comments;
  final bool hasError;
  final String? errorMessage;

  CommentDataState({this.comments = const [], this.hasError = false, this.errorMessage});

  @override
  List<Object?> get props => [comments, hasError, errorMessage];
}
