import 'package:flutter/material.dart';
import 'package:partograph/model/antenatal_clinic_finding.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/provider/utility_provider.dart';
import 'package:partograph/ui/widgets/form_submit_button.dart';
import 'package:partograph/ui/widgets/partograph_form_ui.dart';
import 'package:provider/provider.dart';

class AntenatalClinicFindingsForm extends StatefulWidget {
  const AntenatalClinicFindingsForm({Key? key}) : super(key: key);

  @override
  State<AntenatalClinicFindingsForm> createState() =>
      _AntenatalClinicFindingsFormState();
}

class _AntenatalClinicFindingsFormState
    extends State<AntenatalClinicFindingsForm> {
  late GlobalKey<FormState> formKey;

  late TextEditingController bloodGroupCtrl;
  late TextEditingController rhCtrl;
  late TextEditingController heightCtrl;
  late TextEditingController numberOfVisitsCtrl;
  late TextEditingController iptDosesCtrl;
  late TextEditingController ttDosesCtrl;
  late TextEditingController itnUsedCtrl;
  late TextEditingController lastMeasuredHbCtrl;
  late TextEditingController lastMeasuredHbDateCtrl;
  late TextEditingController pmtctCtrl;
  late TextEditingController pmtctDateCtrl;
  late TextEditingController artCtrl;
  late TextEditingController vdrlCtrl;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    bloodGroupCtrl = TextEditingController();
    rhCtrl = TextEditingController();
    heightCtrl = TextEditingController();
    numberOfVisitsCtrl = TextEditingController();
    iptDosesCtrl = TextEditingController();
    ttDosesCtrl = TextEditingController();
    itnUsedCtrl = TextEditingController();
    lastMeasuredHbCtrl = TextEditingController();
    lastMeasuredHbDateCtrl = TextEditingController();
    pmtctCtrl = TextEditingController();
    pmtctDateCtrl = TextEditingController();
    artCtrl = TextEditingController();
    vdrlCtrl = TextEditingController();
    super.initState();
  }

  void save() async {
    final utilityProvider =
        Provider.of<UtilityProvider>(context, listen: false);
    final motherProvider = Provider.of<MotherProvider>(context, listen: false);

    if (formKey.currentState!.validate()) {
      AntenatalClinicFinding val = AntenatalClinicFinding(
        bloodGroup: bloodGroupCtrl.text,
        rh: rhCtrl.text,
        height: double.parse(heightCtrl.text),
        numberOfVisits: int.parse(numberOfVisitsCtrl.text),
        iptDoses: iptDosesCtrl.text,
        ttDoses: ttDosesCtrl.text,
        itnUsed: itnUsedCtrl.text,
        lastMeasuredHb: lastMeasuredHbCtrl.text,
        lastMeasuredHbDate: lastMeasuredHbDateCtrl.text,
        pmtct: pmtctCtrl.text,
        pmtctDate: pmtctDateCtrl.text,
        artProphylaxis: artCtrl.text,
        vdrl: vdrlCtrl.text,
      );

      await motherProvider.postAntenatalClinicFinding(
          val, utilityProvider.admissionInfoId);

      utilityProvider.currentIndex = 3;
      utilityProvider.setCurrentPageIndex = 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PartographFormUi(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: bloodGroupCtrl,
              decoration: const InputDecoration(
                label: Text('Blood Group'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: rhCtrl,
              decoration: const InputDecoration(
                label: Text('RH'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: heightCtrl,
              decoration: const InputDecoration(
                label: Text('Height'),
                suffix: Text('cm'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: numberOfVisitsCtrl,
              decoration: const InputDecoration(
                label: Text('Number of visits'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: iptDosesCtrl,
              decoration: const InputDecoration(
                label: Text('IPT doses'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: ttDosesCtrl,
              decoration: const InputDecoration(
                label: Text('TT doses'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: itnUsedCtrl,
              decoration: const InputDecoration(
                label: Text('ITN used'),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: lastMeasuredHbCtrl,
                    decoration: const InputDecoration(
                      label: Text('Last measured Hb'),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: lastMeasuredHbDateCtrl,
                    decoration: const InputDecoration(
                      label: Text('Date'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: pmtctCtrl,
                    decoration: const InputDecoration(
                      label: Text('PMTCT'),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: pmtctDateCtrl,
                    decoration: const InputDecoration(
                      label: Text('Date'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: artCtrl,
              decoration: const InputDecoration(
                label: Text('ART/Prophylaxis'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: vdrlCtrl,
              decoration: const InputDecoration(
                label: Text('VDRL'),
              ),
            ),
            const SizedBox(height: 20),
            FormSubmitButton(onPressed: save),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloodGroupCtrl.dispose();
    rhCtrl.dispose();
    heightCtrl.dispose();
    numberOfVisitsCtrl.dispose();
    iptDosesCtrl.dispose();
    ttDosesCtrl.dispose();
    itnUsedCtrl.dispose();
    lastMeasuredHbCtrl.dispose();
    lastMeasuredHbDateCtrl.dispose();
    pmtctCtrl.dispose();
    pmtctDateCtrl.dispose();
    artCtrl.dispose();
    vdrlCtrl.dispose();
    super.dispose();
  }
}
