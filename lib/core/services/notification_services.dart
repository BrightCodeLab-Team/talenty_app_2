import 'package:logger/logger.dart';

class NotificationsService {
  final log = Logger();
}

///
///received notification model class for ios didNotificationReceived callback
///
class ReceivedNotification {
  final int? id;
  final String? title;
  final String? body;
  final String? payload;

  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });
}
