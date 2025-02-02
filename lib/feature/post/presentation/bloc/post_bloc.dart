import 'package:bloc/bloc.dart';
import 'package:todo_app/feature/post/presentation/bloc/post_event.dart';
import 'package:todo_app/feature/post/presentation/bloc/post_state.dart';

/// Doc Required
class PostBloc extends Bloc<PostEvent, PostState> {
  /// Doc Required
  PostBloc() : super(InitPostState()) {
    on<InitPostEvent>(_init);
  }

  Future<void> _init(
    final InitPostEvent event,
    final Emitter<PostState> emit,
  ) async {
    emit(InitPostState());
  }
}
