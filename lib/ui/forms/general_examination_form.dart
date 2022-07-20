import 'package:flutter/material.dart';
import 'package:partograph/model/general_examination.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/provider/utility_provider.dart';
import 'package:partograph/ui/widgets/form_submit_button.dart';
import 'package:partograph/ui/widgets/partograph_form_ui.dart';
import 'package:provider/provider.dart';

class GeneralExaminationForm extends StatefulWidget {
  const GeneralExaminationForm({Key? key}) : super(key: key);

  @override
  State<GeneralExaminationForm> createState() => _GeneralExaminationFormState();
}

class _GeneralExaminationFormState extends State<GeneralExaminationForm> {
  late GlobalKey<FormState> formKey;

  late TextEditingController generalConditionCtrl;
  late TextEditingController pulseRateCtrl;
  late TextEditingController respRateCtrl;
  late TextEditingController temperatureCtrl;
  late TextEditingController bloodPressureCtrl;
  late TextEditingController urineProteinCtrl;
  late TextEditingController urineAcetoneCtrl;
  late TextEditingController fundalHeightCtrl;
  late TextEditingController fundalLevelCtrl;
  late TextEditingController fundalPresentationCtrl;
  late TextEditingController fundalLieCtrl;
  late TextEditingController contractionsCtrl;
  late TextEditingController fetalHeartRateCtrl;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    generalConditionCtrl = TextEditingController();
    pulseRateCtrl = TextEditingController();
    respRateCtrl = TextEditingController();
    temperatureCtrl = TextEditingController();
    bloodPressureCtrl = TextEditingController();
    urineProteinCtrl = TextEditingController();
    urineAcetoneCtrl = TextEditingController();
    fundalHeightCtrl = TextEditingController();
    fundalLevelCtrl = TextEditingController();
    fundalPresentationCtrl = TextEditingController();
    fundalLieCtrl = TextEditingController();
    contractionsCtrl = TextEditingController();
    fetalHeartRateCtrl = TextEditingController();
    super.initState();
  }

  void save() async {
    final utilityProvider =
        Provider.of<UtilityProvider>(context, listen: false);
    final motherProvider = Provider.of<MotherProvider>(context, listen: false);

    if (formKey.currentState!.validate()) {
      GeneralExamination val = GeneralExamination(
        generalCondition: generalConditionCtrl.text,
        pulseRate: double.parse(pulseRateCtrl.text),
        respRate: double.parse(respRateCtrl.text),
        temperature: double.parse(temperatureCtrl.text),
        bloodPressure: double.parse(bloodPressureCtrl.text),
        urineProtein: urineProteinCtrl.text,
        urineAcetone: urineAcetoneCtrl.text,
        fundalHeight: double.parse(fundalHeightCtrl.text),
        level: fundalLevelCtrl.text,
        presentation: fundalPresentationCtrl.text,
        lie: fundalLieCtrl.text,
        contractionInTenMinutes: contractionsCtrl.text,
        fetalHeartRate: double.parse(fetalHeartRateCtrl.text),
      );

      await motherProvider.postGeneralExamination(
          val, utilityProvider.admissionInfoId);

      utilityProvider.currentIndex = 5;
      utilityProvider.setCurrentPageIndex = 5;
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
              controller: generalConditionCtrl,
              decoration: const InputDecoration(
                label: Text('General condition'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: pulseRateCtrl,
              decoration: const InputDecoration(
                label: Text('Pulse rate'),
                suffix: Text('b/min'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: respRateCtrl,
              decoration: const InputDecoration(
                label: Text('Resp rate'),
                suffix: Text('bpm'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: temperatureCtrl,
              decoration: const InputDecoration(
                label: Text('Temperature'),
                suffix: Text('C'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: bloodPressureCtrl,
              decoration: const InputDecoration(
                label: Text('Blood pressure'),
                suffix: Text('mmHg'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: urineProteinCtrl,
              decoration: const InputDecoration(
                label: Text('Urine Protein'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: urineAcetoneCtrl,
              decoration: const InputDecoration(
                label: Text('Acetone'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: fundalHeightCtrl,
              decoration: const InputDecoration(
                label: Text('Fundal Height'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: fundalLevelCtrl,
              decoration: const InputDecoration(
                label: Text('Level'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: fundalPresentationCtrl,
              decoration: const InputDecoration(
                label: Text('Presentation'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: fundalLieCtrl,
              decoration: const InputDecoration(
                label: Text('Lie'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: contractionsCtrl,
              decoration: const InputDecoration(
                label: Text('Contraction in 10 minutes'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: fetalHeartRateCtrl,
              decoration: const InputDecoration(
                label: Text('Fetal heart rate (FHR)'),
                suffix: Text('/minute'),
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
    generalConditionCtrl.dispose();
    pulseRateCtrl.dispose();
    respRateCtrl.dispose();
    temperatureCtrl.dispose();
    bloodPressureCtrl.dispose();
    urineProteinCtrl.dispose();
    urineAcetoneCtrl.dispose();
    fundalHeightCtrl.dispose();
    fundalLevelCtrl.dispose();
    fundalPresentationCtrl.dispose();
    fundalLieCtrl.dispose();
    contractionsCtrl.dispose();
    fetalHeartRateCtrl.dispose();
    super.dispose();
  }
}
