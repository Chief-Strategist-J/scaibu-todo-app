import 'package:bloc/bloc.dart';

import 'project_event.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectState().init()) {
    on<InitProjectEvent>(_init);
  }

  void _init(InitProjectEvent event, Emitter<ProjectState> emit) async {
    emit(state.clone());
  }
}
