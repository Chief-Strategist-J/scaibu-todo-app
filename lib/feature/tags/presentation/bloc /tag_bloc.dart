import 'package:bloc/bloc.dart';

import 'tag_event.dart';
import 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  TagBloc() : super(TagState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<TagState> emit) async {
    emit(state.clone());
  }
}
