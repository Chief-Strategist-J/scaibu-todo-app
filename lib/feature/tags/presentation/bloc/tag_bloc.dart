// ignore_for_file: avoid_public_methods_on_bloc,
// ignore_for_file: avoid_public_properties_on_bloc_and_cubit
import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TagBloc extends Bloc<TagEvent, TagState> {
  /// Doc Required
  TagBloc() : super(TagDataState()) {
    on<InitTagEvent>(_onInit);
    on<CreateTagEvent>(_onCreateTag);
    on<UpdateColorOfTagEvent>(_onUpdateTagColor);
  }

  /// Doc Required
  final TextEditingController tagTextEditingController =
      TextEditingController();

  /// Doc Required
  final FocusNode tagTextFocusNode = FocusNode();

  @override
  Future<void> close() {
    tagTextEditingController.dispose();
    tagTextFocusNode.dispose();
    return super.close();
  }

  Future<void> _onInit(
    final InitTagEvent event,
    final Emitter<TagState> emit,
  ) async {
    if (state is TagDataState) {
      final TagDataState currState = state as TagDataState;
      emit(currState.copyWith());
    }
  }

  Future<void> _onUpdateTagColor(
    final UpdateColorOfTagEvent event,
    final Emitter<TagState> emit,
  ) async {
    if (state is TagDataState) {
      final TagDataState currState = state as TagDataState;
      emit(currState.copyWith(color: event.color));
    }
  }

  Future<void> _onCreateTag(
    final CreateTagEvent event,
    final Emitter<TagState> emit,
  ) async {
    if (state is TagDataState) {
      final TagDataState currState = state as TagDataState;

      final Map<String, Object?> createTagReq = <String, Object?>{
        'color': _getColors(currState),
        'name': tagTextEditingController.text,
        'created_by': userCredentials.getUserId,
      };

      final CreateTagUseCase createTagUseCase = getIt.get<CreateTagUseCase>(
        instanceName: TagsDependencyInjection.createTagUseCase,
      );

      try {
        await createTagUseCase(createTagReq)
            .then((final Either<Failure, void> value) => toast('Tag is added'));
      } catch (e) {
        debugPrint('Error creating tag: $e');
      }
    }
  }

  String _getColors(final TagDataState currState) {
    final Color color = currState.color ?? blackColor;
    return '${color.a.toInt().toRadixString(16).padLeft(2, '0')}'
            '${color.r.toInt().toRadixString(16).padLeft(2, '0')}'
            '${color.g.toInt().toRadixString(16).padLeft(2, '0')}'
            '${color.b.toInt().toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }
}
