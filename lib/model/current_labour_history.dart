class CurrentLabourHistory {
  final String labourOnset;
  final String labourOnsetDate;
  final String labourOnsetTime;
  final String membraneRuptured;
  final String membraneRupturedDate;
  final String membraneRupturedTime;
  final String fetalMovement;

  CurrentLabourHistory({
    required this.labourOnset,
    required this.labourOnsetDate,
    required this.labourOnsetTime,
    required this.membraneRuptured,
    required this.membraneRupturedDate,
    required this.membraneRupturedTime,
    required this.fetalMovement,
  });

  factory CurrentLabourHistory.fromMap(Map<String, dynamic> json) {
    return CurrentLabourHistory(
      labourOnset: json['labour_onset'],
      labourOnsetDate: json['labour_onset_date'],
      labourOnsetTime: json['labour_onset_time'],
      membraneRuptured: json['membranes_ruptured'],
      membraneRupturedDate: json['membranes_ruptured_date'],
      membraneRupturedTime: json['membranes_ruptured_time'],
      fetalMovement: json['fetal_mevements'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> json = {
      'labour_onset': labourOnset,
      'labour_onset_date': labourOnsetDate,
      'labour_onset_time': labourOnsetTime,
      'membranes_ruptured': membraneRuptured,
      'membranes_ruptured_date': membraneRupturedDate,
      'membranes_ruptured_time': membraneRupturedTime,
      'fetal_mevements': fetalMovement,
    };

    return json;
  }
}
