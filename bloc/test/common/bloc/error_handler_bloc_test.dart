import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:template_bloc/common/bloc/error_handler_bloc/error_handler_bloc.dart';
import 'package:template_bloc/common/bloc/error_handler_bloc/error_handler_event.dart';
import 'package:template_bloc/common/bloc/error_handler_bloc/error_handler_state.dart';
import 'package:template_bloc/common/logger/logger.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  group('ErrorHandlerBloc', () {
    late Logger logger;
    late ErrorHandlerBloc errorHandlerBloc;

    final receiveTimeoutDioErr = DioError(
      type: DioErrorType.receiveTimeout,
      requestOptions: RequestOptions(path: '/'),
    );

    final connectTimeoutDioErr = DioError(
      type: DioErrorType.connectTimeout,
      requestOptions: RequestOptions(path: '/'),
    );

    final sendTimeoutDioErr = DioError(
      type: DioErrorType.sendTimeout,
      requestOptions: RequestOptions(path: '/'),
    );

    final badRequestDioErr = DioError(
      type: DioErrorType.response,
      requestOptions: RequestOptions(path: '/'),
      response: Response<dynamic>(
        statusCode: 400,
        requestOptions: RequestOptions(path: '/'),
      ),
    );

    final forbiddenDioErr = DioError(
      type: DioErrorType.response,
      requestOptions: RequestOptions(path: '/'),
      response: Response<dynamic>(
        statusCode: 403,
        requestOptions: RequestOptions(path: '/'),
      ),
    );

    final notFoundDioErr = DioError(
      type: DioErrorType.response,
      requestOptions: RequestOptions(path: '/'),
      response: Response<dynamic>(
        statusCode: 404,
        requestOptions: RequestOptions(path: '/'),
      ),
    );

    final internalServerDioErr = DioError(
      type: DioErrorType.response,
      requestOptions: RequestOptions(path: '/'),
      response: Response<dynamic>(
        statusCode: 500,
        requestOptions: RequestOptions(path: '/'),
      ),
    );

    final unknownError = AssertionError('Test unknown error.');

    setUp(() {
      logger = MockLogger();
      errorHandlerBloc = ErrorHandlerBloc(logger);
    });

    test('Initial state is InitialErrorHandlerState', () {
      expect(errorHandlerBloc.state, isA<InitialErrorHandlerState>());
    });

    group('Handle network errors', () {
      blocTest<ErrorHandlerBloc, ErrorHandlerState>(
        'Handle DioErrorType.RECEIVE_TIMEOUT error',
        build: () => errorHandlerBloc,
        act: (bloc) async => bloc
            .add(HandleErrorEvent(receiveTimeoutDioErr, StackTrace.current)),
        expect: () => [isA<TimeoutErrorState>()],
      );

      blocTest<ErrorHandlerBloc, ErrorHandlerState>(
        'Handle DioErrorType.CONNECT_TIMEOUT error',
        build: () => errorHandlerBloc,
        act: (bloc) async => bloc
            .add(HandleErrorEvent(connectTimeoutDioErr, StackTrace.current)),
        expect: () => [isA<TimeoutErrorState>()],
      );

      blocTest<ErrorHandlerBloc, ErrorHandlerState>(
        'Handle DioErrorType.SEND_TIMEOUT error',
        build: () => errorHandlerBloc,
        act: (bloc) async =>
            bloc.add(HandleErrorEvent(sendTimeoutDioErr, StackTrace.current)),
        expect: () => [isA<TimeoutErrorState>()],
      );

      blocTest<ErrorHandlerBloc, ErrorHandlerState>(
        'Handle HTTP 400 Bad Request',
        build: () => errorHandlerBloc,
        act: (bloc) async =>
            bloc.add(HandleErrorEvent(badRequestDioErr, StackTrace.current)),
        expect: () => [isA<ValidationErrorState>()],
      );

      blocTest<ErrorHandlerBloc, ErrorHandlerState>(
        'Handle HTTP 403 Forbidden',
        build: () => errorHandlerBloc,
        act: (bloc) async =>
            bloc.add(HandleErrorEvent(forbiddenDioErr, StackTrace.current)),
        expect: () => [isA<ForbiddenErrorState>()],
      );

      blocTest<ErrorHandlerBloc, ErrorHandlerState>(
        'Handle HTTP 404 Not Found',
        build: () => errorHandlerBloc,
        act: (bloc) async =>
            bloc.add(HandleErrorEvent(notFoundDioErr, StackTrace.current)),
        expect: () => [isA<NotFoundErrorState>()],
      );

      blocTest<ErrorHandlerBloc, ErrorHandlerState>(
        'Handle HTTP 500 Internal Server Error',
        build: () => errorHandlerBloc,
        act: (bloc) async => bloc
            .add(HandleErrorEvent(internalServerDioErr, StackTrace.current)),
        expect: () => [isA<InternalServerErrorState>()],
      );
    });

    group('Unknown errors', () {
      blocTest<ErrorHandlerBloc, ErrorHandlerState>(
        'Handle unknown error',
        build: () => errorHandlerBloc,
        act: (bloc) async =>
            bloc.add(HandleErrorEvent(unknownError, StackTrace.current)),
        expect: () => [isA<UnknownErrorState>()],
      );
    });
  });
}
