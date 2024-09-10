import 'package:bloc/bloc.dart';

import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(InitCommentState()) {
    on<InitCommentsEvent>(_init);
  }

  void _init(InitCommentsEvent event, Emitter<CommentState> emit) async {
    emit(InitCommentState());
  }
}
