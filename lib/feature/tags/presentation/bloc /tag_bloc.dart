import 'package:bloc/bloc.dart';

import 'tag_event.dart';
import 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  TagBloc() : super(TagState().init()) {
    on<InitTagEvent>(_init);
  }

  void _init(InitTagEvent event, Emitter<TagState> emit) async {
    emit(state.clone());
  }
}
