import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:todo_app/core/app_library.dart';

import 'package:todo_app/core/network/internetConnection/internet_connection_state.dart';

/// Cubit to manage internet connection status.
class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  /// Constructor initializes the internet connection status.
  InternetConnectionCubit()
      : super(InternetConnectionState(
            status: CurrentInternetStatus.disconnected)) {
    _getInternetConnectionStatus();
  }

  bool _internetConnectionStreamInit = true;
  StreamSubscription<InternetStatus>? _internetStatusSubscription;

  @override
  Future<void> close() {
    _internetStatusSubscription?.cancel();
    return super.close();
  }

  /// Initializes the stream for internet connection status.
  void _getInternetConnectionStatus() {
    log('_getInternetConnectionStatus is executed.');
    if (_internetConnectionStreamInit) {
      _internetConnectionStreamInit = false;
      log('INTERNET CONNECTION STREAM IN INITIALIZE');
      _internetStatusSubscription = InternetConnection()
          .onStatusChange
          .listen((final InternetStatus status) {
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

/// Function to update state based on internet connection status.
Future<void> Function() updateStateAccordingToInternetStatus(
  final BuildContext context, {
  required final void Function() onInternetIsConnected,
  required final void Function() onInternetIsNotConnected,
}) {
  final InternetConnectionCubit internetConnectionCubit =
      context.read<InternetConnectionCubit>();

  final StreamSubscription<InternetConnectionState> subscription =
      internetConnectionCubit.stream
          .listen((final InternetConnectionState state) {
    if (state.status == CurrentInternetStatus.connected) {
      onInternetIsConnected.call();
    } else {
      onInternetIsNotConnected.call();
    }
  });

  return subscription.cancel;
}
