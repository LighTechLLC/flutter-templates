import 'package:template_bloc/common/logger/logger.dart';

class ProductionLogger extends Logger {
  @override
  void e({required Object error, String? message, StackTrace? stackTrace}) {}
}
