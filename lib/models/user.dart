import 'dart:math' as math;

class User{
  final String sub;
  final String username;
  final String pseudo;
  final String email;
  final int energy;
  final int experience;

  const User({
    required this.sub,
    required this.username,
    required this.pseudo,
    required this.email,
    required this.energy,
    required this.experience
  });

  int getLevel(){
    return math.pow(experience/100, 1/1.61803398875).round() + 1;
  }

  int getTotalXpNeededToReachLevel(int level){
  return (100 * math.pow(level, 1.61803398875)).round();
  }

  double getExperiencePercentage(){
    return  (experience - (getTotalXpNeededToReachLevel(getLevel() - 1))) / (getTotalXpNeededToReachLevel(getLevel())- getTotalXpNeededToReachLevel(getLevel() - 1));
  }
}