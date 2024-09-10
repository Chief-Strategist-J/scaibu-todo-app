import 'package:equatable/equatable.dart';

sealed class CommentEvent extends Equatable {}

class InitCommentsEvent extends CommentEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
