import '../utils/date.dart';

class Theme{
  final String id;
  final String code;
  final String color;
  final String icon;
  final List<dynamic> categories;
  final dynamic names;
  final dynamic shortNames;
  final DateTime? createdAt;
  final int quizCount;
  final bool isHidden;
  final DateTime? deletedAt;

  const Theme({
    required this.id,
    required this.code,
    required this.color,
    required this.icon,
    required this.categories,
    required this.names,
    required this.shortNames,
    required this.createdAt,
    required this.quizCount,
    required this.isHidden,
    required this.deletedAt
  });

  factory Theme.fromJson(Map<String, dynamic> json) {
    return Theme(
        id: json['_id'],
        code: json['code'],
        color: json['color'],
        icon: json['icon'],
        categories: json['categories'],
        names: json['names'],
        shortNames: json['shortNames'],
        createdAt: isoDateToDateTime(json['createdAt'].toString()),
        quizCount: json['quizCount'],
        isHidden: json['isHidden'],
        deletedAt: isoDateToDateTime(json['deletedAt'].toString())
    );
  }
}