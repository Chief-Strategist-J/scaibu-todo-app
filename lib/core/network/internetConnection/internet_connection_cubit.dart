import 'package:todo_app/core/app_library.dart';

import 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  bool _internetConnectionStreamInit = true;
  StreamSubscription<InternetStatus>? _internetStatusSubscription;

  InternetConnectionCubit() : super(InternetConnectionState(status: CurrentInternetStatus.disconnected)) {
    _getInternetConnectionStatus();
  }

  @override
  Future<void> close() {
    _internetStatusSubscription?.cancel();
    return super.close();
  }

  void _getInternetConnectionStatus() {
    log('_getInternetConnectionStatus is executed.');
    if (_internetConnectionStreamInit) {
      _internetConnectionStreamInit = false;
      log('INTERNET CONNECTION STREAM IN INITIALIZE');
      _internetStatusSubscription = InternetConnection().onStatusChange.listen((status) {
        if (status == InternetStatus.connected) {
          isInternetConnected = true;
          emit(state.clone(status: CurrentInternetStatus.connected));
        } else {
          isInternetConnected = false;
          emit(state.clone(status: CurrentInternetStatus.disconnected));
        }
      });
    }
  }
}
