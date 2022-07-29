import '../utils/date.dart';

class Theme{
  final String id;
  final String code;
  final String color;
  final String icon;
  final List<dynamic> categories;
  final dynamic name;
  final dynamic shortName;
  final DateTime? createdAt;
  final int quizzesCount;
  final bool isHidden;
  final DateTime? deletedAt;

  const Theme({
    required this.id,
    required this.code,
    required this.color,
    required this.icon,
    required this.categories,
    required this.name,
    required this.shortName,
    required this.createdAt,
    required this.quizzesCount,
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
        name: json['name'],
        shortName: json['shortName'],
        createdAt: isoDateToDateTime(json['createdAt'].toString()),
        quizzesCount: json['quizzesCount'],
        isHidden: json['isHidden'],
        deletedAt: isoDateToDateTime(json['deletedAt'].toString())
    );
  }
}