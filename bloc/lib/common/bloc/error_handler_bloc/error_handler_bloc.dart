import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_bloc/common/bloc/error_handler_bloc/error_handler_event.dart';
import 'package:template_bloc/common/bloc/error_handler_bloc/error_handler_state.dart';
import 'package:template_bloc/common/logger/logger.dart';

class ErrorHandlerBloc extends Bloc<ErrorHandlerEvent, ErrorHandlerState> {
  ErrorHandlerBloc(this._logger) : super(InitialErrorHandlerState()) {
    on<HandleErrorEvent>(_onHandleErrorEvent);
  }

  final Logger _logger;

  Future<void> _onHandleErrorEvent(
    HandleErrorEvent event,
    Emitter<ErrorHandlerState> emit,
  ) async {
    if (event.error is DioError) {
      _handleDioError(event.error as DioError, event.stackTrace, emit);
    } else {
      _handleUnknownError(event.error, event.stackTrace, emit);
    }
  }

  void _handleDioError(
    DioError error,
    StackTrace stackTrace,
    Emitter<ErrorHandlerState> emit,
  ) {
    if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.receiveTimeout ||
        error.type == DioErrorType.sendTimeout) {
      emit(TimeoutErrorState());
    } else if (error.type == DioErrorType.response) {
      _handleDioResponseError(error, stackTrace, emit);
    } else {
      _handleUnknownError(error, stackTrace, emit);
    }
  }

  void _handleDioResponseError(
    DioError error,
    StackTrace stackTrace,
    Emitter<ErrorHandlerState> emit,
  ) {
    final statusCode = error.response?.statusCode;
    switch (statusCode) {
      case 400:
        emit(ValidationErrorState());
        break;
      case 403:
        emit(ForbiddenErrorState());
        break;
      case 404:
        emit(NotFoundErrorState());
        break;
      case 500:
        emit(InternalServerErrorState());
        break;
      default:
        _handleUnknownError(error, stackTrace, emit);
    }
  }

  void _handleUnknownError(
    Object error,
    StackTrace stackTrace,
    Emitter<ErrorHandlerState> emit,
  ) {
    _logger.e(
      message: 'Unknown error handled in ErrorHandlerBloc',
      error: error,
      stackTrace: stackTrace,
    );
    emit(UnknownErrorState());
  }
}
