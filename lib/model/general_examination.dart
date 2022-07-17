class GeneralExamination {
  final String generalCondition;
  final double pulseRate;
  final double respRate;
  final double temperature;
  final double bloodPressure;
  final String urineProtein;
  final String urineAcetone;
  final double fundalHeight;
  final String level;
  final String presentation;
  final String lie;
  final String contractionInTenMinutes;
  final double fetalHeartRate;

  GeneralExamination({
    required this.generalCondition,
    required this.pulseRate,
    required this.respRate,
    required this.temperature,
    required this.bloodPressure,
    required this.urineProtein,
    required this.urineAcetone,
    required this.fundalHeight,
    required this.level,
    required this.presentation,
    required this.lie,
    required this.contractionInTenMinutes,
    required this.fetalHeartRate,
  });

  factory GeneralExamination.fromMap(Map<String, dynamic> json) {
    return GeneralExamination(
        generalCondition: json['general_condition'],
        pulseRate: json['pulse_rate'],
        respRate: json['resp_rate'],
        temperature: json['temperature'],
        bloodPressure: json['blood_pressure'],
        urineProtein: json['urine_protein'],
        urineAcetone: json['urine_acetone'],
        fundalHeight: json['fundal_height'],
        level: json['level'],
        presentation: json['presentation'],
        lie: json['lie'],
        contractionInTenMinutes: json['contraction_in_10_minutes'],
        fetalHeartRate: json['fetal_heart_rate']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> json = {
      'general_condition': generalCondition,
      'pulse_rate': pulseRate,
      'resp_rate': respRate,
      'temperature': temperature,
      'blood_pressure': bloodPressure,
      'urine_protein': urineProtein,
      'urine_acetone': urineAcetone,
      'fundal_height': fundalHeight,
      'level': level,
      'presentation': presentation,
      'lie': lie,
      'contraction_in_10_minutes': contractionInTenMinutes,
      'fetal_heart_rate': fetalHeartRate,
    };

    return json;
  }
}
