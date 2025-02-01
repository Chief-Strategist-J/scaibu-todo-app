import 'package:bloc/bloc.dart';

import 'package:todo_app/feature/comment/presentation/bloc/comment_event.dart';
import 'package:todo_app/feature/comment/presentation/bloc/comment_state.dart';
/// Doc Required
class CommentBloc extends Bloc<CommentEvent, CommentState> {
  /// Doc Required
  CommentBloc() : super(InitCommentState()) {
    on<InitCommentsEvent>(_init);
  }

  Future<void> _init(
      final InitCommentsEvent event, final Emitter<CommentState> emit) async {
    emit(InitCommentState());
  }
}
