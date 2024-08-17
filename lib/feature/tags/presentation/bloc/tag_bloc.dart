import 'package:todo_app/core/app_library.dart';

import 'tag_event.dart';
import 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  TagBloc({required this.tagsDatabaseRepository, required this.tagsFirebaseRepository}) : super(TagDataState()) {
    on<InitTagEvent>(_init);
  }

  final tagTextEditingController = TextEditingController();
  final tagTextFocusNode = FocusNode();

  @override
  Future<void> close() {
    tagTextEditingController.dispose();
    tagTextFocusNode.dispose();
    return super.close();
  }

  void _init(InitTagEvent event, Emitter<TagState> emit) async {
    if (state is TagDataState) {
      final currState = state as TagDataState;
      emit(currState.copyWith());
    }
  }
}
