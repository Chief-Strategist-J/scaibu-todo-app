import 'package:bloc/bloc.dart';
import 'package:todo_app/feature/tags/domain/repositories/tags_repository.dart';

import 'tag_event.dart';
import 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagsRepository tagsDatabaseRepository;
  final TagsRepository tagsFirebaseRepository;

  TagBloc({required this.tagsDatabaseRepository, required this.tagsFirebaseRepository}) : super(TagState().init()) {
    on<InitTagEvent>(_init);
  }

  void _init(InitTagEvent event, Emitter<TagState> emit) async {
    emit(state.clone());
  }
}
