enum CurrentInternetStatus { connected, disconnected }

class InternetConnectionState {
  final CurrentInternetStatus status;

  InternetConnectionState({required this.status});

  InternetConnectionState init() {
    return InternetConnectionState(status: CurrentInternetStatus.disconnected);
  }

  InternetConnectionState clone({CurrentInternetStatus? status}) {
    return InternetConnectionState(status: status ?? this.status);
  }
}
