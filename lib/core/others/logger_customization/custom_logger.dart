import 'package:logger/logger.dart';
import 'package:talenty_app/core/others/logger_customization/custom_log_output.dart'
    show CustomLogOutput;
import 'package:talenty_app/core/others/logger_customization/custom_log_printer.dart';

class CustomLogger extends Logger {
  final String className;

  CustomLogger({required this.className})
    : super(
        output: CustomLogOutput(),
        printer: CustomLogPrinter(className: className),
      );
}
