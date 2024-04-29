class AuditLogModel {
  int id;
  String user;
  String action;
  String tableName;
  int recordId;
  String oldValue;
  String newValue;
  DateTime loggedAt;

  AuditLogModel({
    required this.id,
    required this.user,
    required this.action,
    required this.tableName,
    required this.recordId,
    required this.oldValue,
    required this.newValue,
    required this.loggedAt,
  });

  factory AuditLogModel.fromJson(Map<String, dynamic> json) {
    return AuditLogModel(
      id: json['id'] ?? 0,
      user: json['user'] ?? '',
      action: json['action'] ?? '',
      tableName: json['tableName'] ?? '',
      recordId: json['recordId'] ?? 0,
      oldValue: json['oldValue'] ?? '',
      newValue: json['newValue'] ?? '',
      loggedAt: json['loggedAt'] != null
          ? DateTime.parse(json['loggedAt'])
          : DateTime.now(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'action': action,
      'tableName': tableName,
      'recordId': recordId,
      'oldValue': oldValue,
      'newValue': newValue,
      'loggedAt': loggedAt.toIso8601String(),
    };
  }
}
