import '../utils/date.dart';

class Category{
  final String id;
  final String code;
  final String color;
  final String icon;
  final dynamic names;
  final DateTime? createdAt;
  final int themeCount;
  final bool isHidden;
  final DateTime? deletedAt;

  const Category({
    required this.id,
    required this.code,
    required this.color,
    required this.icon,
    required this.names,
    required this.createdAt,
    required this.themeCount,
    required this.isHidden,
    required this.deletedAt
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['_id'],
        code: json['code'],
        color: json['color'],
        icon: json['icon'],
        names: json['names'],
        createdAt: isoDateToDateTime(json['createdAt'].toString()),
        themeCount: json['themeCount'],
        isHidden: json['isHidden'],
        deletedAt: isoDateToDateTime(json['deletedAt'].toString())
    );
  }
}