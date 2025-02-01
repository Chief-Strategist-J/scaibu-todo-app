import 'package:equatable/equatable.dart';
import 'package:todo_app/feature/comment/domain/entity/comment_entity.dart';

/// Doc Required
sealed class CommentState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

/// Doc Required
class InitCommentState extends CommentState {}

/// Doc Required
class CommentEmptyState extends CommentState {}

/// Doc Required
class CommentLoadingState extends CommentState {
  /// Doc Required
  CommentLoadingState({this.isInitialLoad = false});

  /// Doc Required
  final bool isInitialLoad;

  @override
  List<Object?> get props => <Object?>[isInitialLoad];
}

/// Doc Required
class CommentErrorState extends CommentState {
  /// Doc Required
  CommentErrorState(this.errorMessage);

  /// Doc Required
  final String errorMessage;

  @override
  List<Object?> get props => <Object?>[errorMessage];
}

/// Doc Required
class CommentOperationState extends CommentState {
  /// Doc Required
  CommentOperationState({this.isProcessing = true, this.operationMessage});

  /// Doc Required
  final bool isProcessing;

  /// Doc Required
  final String? operationMessage;

  @override
  List<Object?> get props => <Object?>[isProcessing, operationMessage];
}

/// Doc Required
class CommentDataState extends CommentState {
  /// Doc Required
  CommentDataState({
    this.comments = const <CommentEntity>[],
    this.hasError = false,
    this.errorMessage,
  });

  /// Doc Required
  final List<CommentEntity> comments;

  /// Doc Required
  final bool hasError;

  /// Doc Required
  final String? errorMessage;

  @override
  List<Object?> get props => <Object?>[comments, hasError, errorMessage];
}
