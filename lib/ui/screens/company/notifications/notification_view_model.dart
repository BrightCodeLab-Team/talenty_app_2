import 'package:talenty_app/core/model/company/notifications.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class NotificationViewModel extends BaseViewModel {
  final List<NotificationModel> _notifications = [
    NotificationModel(
      title: '¡Nuevo match!',
      subtitle: 'Hiciste Match con la vacante de Diseñador UX/UI de Puma.',
      time: 'Hoy',
    ),
    NotificationModel(
      title: '¡Recibiste un mensaje!',
      subtitle:
          'Puma te ha contactado referente a la vacante de Diseñador UX/UI',
      time: 'Ayer',
    ),
    NotificationModel(
      title: '¡Videollamada agendada!',
      subtitle:
          'Puma ha agendado una videollamada referente a la vacante de Diseñador UX/UI para el 23 de marzo a las 8:00 am.',
      time: '19 feb.',
    ),
    NotificationModel(
      title: '¡Recibiste un mensaje!',
      subtitle:
          'Puma te ha contactado referente a la vacante de Diseñador UX/UI',
      time: 'Ayer',
    ),
    NotificationModel(
      title: '¡Nuevo match!',
      subtitle: 'Hiciste Match con la vacante de Diseñador UX/UI de Puma.',
      time: 'Hoy',
    ),
    NotificationModel(
      title: '¡Videollamada agendada!',
      subtitle:
          'Puma ha agendado una videollamada referente a la vacante de Diseñador UX/UI para el 23 de marzo a las 8:00 am.',
      time: '19 feb.',
    ),
    NotificationModel(
      title: '¡Recibiste un mensaje!',
      subtitle:
          'Puma te ha contactado referente a la vacante de Diseñador UX/UI',
      time: 'Ayer',
    ),
    NotificationModel(
      title: '¡Nuevo match!',
      subtitle: 'Hiciste Match con la vacante de Diseñador UX/UI de Puma.',
      time: 'Hoy',
    ),
    NotificationModel(
      title: '¡Videollamada agendada!',
      subtitle:
          'Puma ha agendado una videollamada referente a la vacante de Diseñador UX/UI para el 23 de marzo a las 8:00 am.',
      time: '19 feb.',
    ),
    NotificationModel(
      title: '¡Recibiste un mensaje!',
      subtitle:
          'Puma te ha contactado referente a la vacante de Diseñador UX/UI',
      time: 'Ayer',
    ),
    NotificationModel(
      title: '¡Nuevo match!',
      subtitle: 'Hiciste Match con la vacante de Diseñador UX/UI de Puma.',
      time: 'Hoy',
    ),
  ];

  List<NotificationModel> get notifications => _notifications;

  void removeNotification(int index) {
    _notifications.removeAt(index);
    notifyListeners();
  }
}
