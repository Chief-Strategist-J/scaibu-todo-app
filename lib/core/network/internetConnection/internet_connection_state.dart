/// Enum to represent internet connection status.
enum CurrentInternetStatus {
  ///Indicates the device has an active internet connection.
  connected,

  /// Indicates the device does not have an internet connection.
  disconnected
}

/// State to manage internet connection status.
class InternetConnectionState {
  /// Constructor to initialize internet connection state.
  InternetConnectionState({required this.status});

  /// The current status of the internet connection.
  final CurrentInternetStatus status;

  /// Initializes the state to disconnected status.
  InternetConnectionState init() =>
      InternetConnectionState(status: CurrentInternetStatus.disconnected);

  /// Clones the current state with an optional new status.
  InternetConnectionState clone({final CurrentInternetStatus? status}) =>
      InternetConnectionState(status: status ?? this.status);
}
