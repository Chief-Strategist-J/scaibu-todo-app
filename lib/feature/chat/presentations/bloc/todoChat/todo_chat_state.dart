/// Chat State
class TodoChatState {
  /// Chat State
  TodoChatState({this.message, this.isCompleted});

  /// Global message
  final String? message;

  /// Global flag
  final bool? isCompleted;

  /// important method
  TodoChatState copyWith({final String? message, final bool? isCompleted}) =>
      TodoChatState(
        message: message ?? this.message,
        isCompleted: isCompleted ?? this.isCompleted,
      );
}
