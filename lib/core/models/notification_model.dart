class NotificationModel {
  final List<NotificationData> notifications;

  const NotificationModel({
    required this.notifications,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notifications: List.from(json['notifications']).map((e) => NotificationData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notifications': notifications,
    };
  }
}

class NotificationData {
  NotificationData({
    required this.id,
    required this.message,
  });

  late final String id;
  late final String message;

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    message = json['message'] ?? '';
  }
}