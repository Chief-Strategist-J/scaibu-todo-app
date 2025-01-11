enum CurrentInternetStatus { connected, disconnected }

class InternetConnectionState {
  final CurrentInternetStatus status;

  InternetConnectionState({required this.status});

  InternetConnectionState init() =>
      InternetConnectionState(status: CurrentInternetStatus.disconnected);

  InternetConnectionState clone({final CurrentInternetStatus? status}) =>
      InternetConnectionState(status: status ?? this.status);
}
