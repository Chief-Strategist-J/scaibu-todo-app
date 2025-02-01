import 'package:equatable/equatable.dart';
/// Doc Required
sealed class CommentEvent extends Equatable {}
/// Doc Required
class InitCommentsEvent extends CommentEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
