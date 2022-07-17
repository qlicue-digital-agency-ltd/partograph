class AntenatalClinicFinding {
  final String bloodGroup;
  final String rh;
  final double height;
  final int numberOfVisits;
  final String iptDoses;
  final String ttDoses;
  final String itnUsed;
  final String lastMeasuredHb;
  final String lastMeasuredHbDate;
  final String pmtct;
  final String pmtctDate;
  final String artProphylaxis;
  final String vdrl;

  AntenatalClinicFinding({
    required this.bloodGroup,
    required this.rh,
    required this.height,
    required this.numberOfVisits,
    required this.iptDoses,
    required this.ttDoses,
    required this.itnUsed,
    required this.lastMeasuredHb,
    required this.lastMeasuredHbDate,
    required this.pmtct,
    required this.pmtctDate,
    required this.artProphylaxis,
    required this.vdrl,
  });

  factory AntenatalClinicFinding.fromMap(Map<String, dynamic> json) {
    return AntenatalClinicFinding(
      bloodGroup: json['blood_group'],
      rh: json['rh'],
      height: json['height'],
      numberOfVisits: json['number_of_visits'],
      iptDoses: json['ipt_doses'],
      ttDoses: json['tt_doses'],
      itnUsed: json['itn_used'],
      lastMeasuredHb: json['last_measured_hb'],
      lastMeasuredHbDate: json['last_measured_hb_date'],
      pmtct: json['pmtct'],
      pmtctDate: json['pmtct_date'],
      artProphylaxis: json['art_prophylaxis'],
      vdrl: json['vdrl'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> json = {
      'blood_group': bloodGroup,
      'rh': rh,
      'height': height,
      'number_of_visits': numberOfVisits,
      'ipt_doses': iptDoses,
      'tt_doses': ttDoses,
      'itn_used': itnUsed,
      'last_measured_hb': lastMeasuredHb,
      'last_measured_hb_date': lastMeasuredHbDate,
      'pmtct': pmtct,
      'pmtct_date': pmtctDate,
      'art_prophylaxis': artProphylaxis,
      'vdrl': vdrl,
    };

    return json;
  }
}
