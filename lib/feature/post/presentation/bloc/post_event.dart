import 'package:equatable/equatable.dart';

/// Doc Required
sealed class PostEvent extends Equatable{}

/// Doc Required
class InitPostEvent extends PostEvent {
  @override
  List<Object?> get props => <Object?>[];
}

