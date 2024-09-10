import 'package:bloc/bloc.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(InitPostState()) {
    on<InitPostEvent>(_init);
  }

  void _init(InitPostEvent event, Emitter<PostState> emit) async {
    emit(InitPostState());
  }
}
