import 'package:bloc/bloc.dart';
import 'package:todo_app/feature/settings/presentation/bloc/setting_event.dart';
import 'package:todo_app/feature/settings/presentation/bloc/setting_state.dart';

/// Doc Required
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  /// Doc Required
  SettingBloc() : super(InitSettingState()) {
    on<InitSettingEvent>(_init);
  }

  Future<void> _init(
    final InitSettingEvent event,
    final Emitter<SettingState> emit,
  ) async {
    emit(InitSettingState());
  }
}
