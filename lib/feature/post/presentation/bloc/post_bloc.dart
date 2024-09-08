import 'package:bloc/bloc.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(InitPostState()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<PostState> emit) async {
    emit(InitPostState());
  }
}
