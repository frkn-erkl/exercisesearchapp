import 'package:caseapp/models/ExpandableListItem.dart';

List<ExpandableListItem> generateItems() {
  return [
    ExpandableListItem(
      headerValue: 'Exercise Type',
      subItems: [
        'Cardio',
        'Olympic Weightlifting',
        'Plyometrics',
        'Powerlifting',
        'Strength',
        'Stretching',
        'Strongman',
      ],
    ),
    ExpandableListItem(
      headerValue: 'Muscle Type',
      subItems: [
        'Abdominals',
        'Abductors',
        'Adductors',
        'Biceps',
        'Calves',
        'Chest',
        'Forearms',
        'Glutes',
        'Hamstrings',
        'Lats',
        'Lower Back',
        'Middle Back',
        'Neck',
        'Quadriceps',
        'Traps',
        'Triceps',
      ],
    ),
  ];
}