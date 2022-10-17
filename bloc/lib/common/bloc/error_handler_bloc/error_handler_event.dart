import 'package:equatable/equatable.dart';

abstract class ErrorHandlerEvent extends Equatable {
  const ErrorHandlerEvent();

  @override
  List<Object> get props => [];
}

class HandleErrorEvent extends ErrorHandlerEvent {
  const HandleErrorEvent(this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;

  @override
  List<Object> get props => [error, stackTrace];
}
