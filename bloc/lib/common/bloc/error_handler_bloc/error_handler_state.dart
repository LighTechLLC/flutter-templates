abstract class ErrorHandlerState {}

class InitialErrorHandlerState extends ErrorHandlerState {}

class TimeoutErrorState extends ErrorHandlerState {}

class InternalServerErrorState extends ErrorHandlerState {}

class ValidationErrorState extends ErrorHandlerState {}

class ForbiddenErrorState extends ErrorHandlerState {}

class NotFoundErrorState extends ErrorHandlerState {}

class UnknownErrorState extends ErrorHandlerState {}

class LocationDeniedState extends ErrorHandlerState {}

class LocationPermanentlyDeniedState extends ErrorHandlerState {}

class LocationRestrictedState extends ErrorHandlerState {}
