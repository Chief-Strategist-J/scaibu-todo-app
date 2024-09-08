import 'package:bloc/bloc.dart';

import 'setting_event.dart';
import 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(InitSettingState()) {
    on<InitSettingEvent>(_init);
  }

  void _init(InitSettingEvent event, Emitter<SettingState> emit) async {
    emit(InitSettingState());
  }
}
