import 'package:todo_app/core/app_library.dart';

import 'tag_event.dart';
import 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  TagBloc({required this.tagsDatabaseRepository, required this.tagsFirebaseRepository}) : super(TagDataState()) {
    on<InitTagEvent>(_onInit);
    on<CreateTagEvent>(_onCreateTag);
    on<UpdateColorOfTagEvent>(_onUpdateTagColor);
  }

  final tagTextEditingController = TextEditingController();
  final tagTextFocusNode = FocusNode();

  @override
  Future<void> close() {
    tagTextEditingController.dispose();
    tagTextFocusNode.dispose();
    return super.close();
  }

  Future<void> _onInit(InitTagEvent event, Emitter<TagState> emit) async {
    if (state is TagDataState) {
      final currState = state as TagDataState;
      emit(currState.copyWith());
    }
  }

  Future<void> _onUpdateTagColor(UpdateColorOfTagEvent event, Emitter<TagState> emit) async {
    if (state is TagDataState) {
      final currState = state as TagDataState;
      emit(currState.copyWith(color: event.color));
    }
  }

  Future<void> _onCreateTag(CreateTagEvent event, Emitter<TagState> emit) async {
    if (state is TagDataState) {
      final currState = state as TagDataState;

      final createTagReq = {
        "color": '0x${(currState.color ?? blackColor).value.toRadixString(16).padLeft(8, '0')}'.toUpperCase(),
        "name": tagTextEditingController.text,
        "created_by": userCredentials.getUserId,
      };

      final createTagUseCase = getIt.get<CreateTagUseCase>(instanceName: TagsDependencyInjection.createTagUseCase);

      try {
        await createTagUseCase(createTagReq);
      } catch (e) {
        debugPrint('Error creating tag: $e');
      }
    }
  }
}
