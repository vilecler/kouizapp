import '../utils/date.dart';

class Category{
  final String id;
  final String code;
  final String color;
  final String icon;
  final dynamic name;
  final DateTime? createdAt;
  final int themesCount;
  final bool isHidden;
  final DateTime? deletedAt;

  const Category({
    required this.id,
    required this.code,
    required this.color,
    required this.icon,
    required this.name,
    required this.createdAt,
    required this.themesCount,
    required this.isHidden,
    required this.deletedAt
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['_id'],
        code: json['code'],
        color: json['color'],
        icon: json['icon'],
        name: json['name'],
        createdAt: isoDateToDateTime(json['createdAt'].toString()),
        themesCount: json['themesCount'],
        isHidden: json['isHidden'],
        deletedAt: isoDateToDateTime(json['deletedAt'].toString())
    );
  }
}