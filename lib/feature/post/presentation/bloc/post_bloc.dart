import 'package:bloc/bloc.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(InitPostState()) {
    on<InitPostEvent>(_init);
  }

  Future<void> _init(
      final InitPostEvent event, final Emitter<PostState> emit,) async {
    emit(InitPostState());
  }
}
