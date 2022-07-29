import '../utils/date.dart';

class Quiz{
  final String id;
  final String link;
  final String code;
  final dynamic name;
  final bool isPremium;
  final List<dynamic> langsAvailable;
  final List<dynamic> questions;
  final int durationBetweenQuestions;
  final int experienceRequired;
  final int experienceWinnable;
  final int energyRequired;
  final int energyWinnable;
  final DateTime? createdAt;
  final bool isHidden;
  final int questionsCount;
  final String? theme;
  final String? themePosition;
  final dynamic? creator;
  final DateTime? deletedAt;

  const Quiz({
    required this.id,
    required this.link,
    required this.code,
    required this.name,
    required this.isPremium,
    required this.langsAvailable,
    required this.questions,
    required this.durationBetweenQuestions,
    required this.experienceRequired,
    required this.experienceWinnable,
    required this.energyRequired,
    required this.energyWinnable,
    required this.createdAt,
    required this.isHidden,
    required this.questionsCount,
    required this.theme,
    required this.themePosition,
    required this.creator,
    required this.deletedAt
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
        id: json['_id'],
        link: json['link'],
        code: json['code'],
        name: json['name'],
        isPremium: json['isPremium'],
        langsAvailable: json['langsAvailable'],
        questions: json['questions'],
        durationBetweenQuestions: json['durationBetweenQuestions'],
        experienceRequired: json['experience']['required'],
        experienceWinnable: json['experience']['winnable'],
        energyRequired: json['energy']['required'],
        energyWinnable: json['energy']['winnable'],
        createdAt: isoDateToDateTime(json['createdAt'].toString()),
        isHidden: json['isHidden'],
        questionsCount: json['questionsCount'],
        theme: json['theme'],
        themePosition: json['themePosition'],
        creator: json['creator'],
        deletedAt: isoDateToDateTime(json['deletedAt'].toString())
    );
  }
}