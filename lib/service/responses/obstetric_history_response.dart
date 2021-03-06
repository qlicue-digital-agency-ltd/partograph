import 'package:partograph/model/obstetric_history.dart';

class ObstetricHistoryResponse {
  ObstetricHistory? obstetricHistory;

  ObstetricHistoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['obstetricHistory'] != null) {
      obstetricHistory = ObstetricHistory.fromMap(json['obstetricHistory']);
    }
  }
}
