import 'package:flutter/material.dart';
import 'package:partograph/model/current_labour_history.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/provider/utility_provider.dart';
import 'package:partograph/ui/widgets/form_submit_button.dart';
import 'package:partograph/ui/widgets/partograph_form_ui.dart';
import 'package:provider/provider.dart';

class CurrentLaborHistoryForm extends StatefulWidget {
  const CurrentLaborHistoryForm({Key? key}) : super(key: key);

  @override
  State<CurrentLaborHistoryForm> createState() =>
      _CurrentLaborHistoryFormState();
}

class _CurrentLaborHistoryFormState extends State<CurrentLaborHistoryForm> {
  late GlobalKey<FormState> formKey;

  late TextEditingController labourOnsetCtrl;
  late TextEditingController labourOnsetDateCtrl;
  late TextEditingController labourOnsetTimeCtrl;
  late TextEditingController membraneRupturedCtrl;
  late TextEditingController membraneRupturedDateCtrl;
  late TextEditingController membraneRupturedTimeCtrl;
  late TextEditingController fetalMovementCtrl;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    labourOnsetCtrl = TextEditingController();
    labourOnsetDateCtrl = TextEditingController();
    labourOnsetTimeCtrl = TextEditingController();
    membraneRupturedCtrl = TextEditingController();
    membraneRupturedDateCtrl = TextEditingController();
    membraneRupturedTimeCtrl = TextEditingController();
    fetalMovementCtrl = TextEditingController();

    super.initState();
  }

  void save() async {
    final utilityProvider =
        Provider.of<UtilityProvider>(context, listen: false);
    final motherProvider = Provider.of<MotherProvider>(context, listen: false);

    if (formKey.currentState!.validate()) {
      CurrentLabourHistory val = CurrentLabourHistory(
        labourOnset: labourOnsetCtrl.text,
        labourOnsetDate: labourOnsetDateCtrl.text,
        labourOnsetTime: labourOnsetTimeCtrl.text,
        membraneRuptured: membraneRupturedCtrl.text,
        membraneRupturedDate: membraneRupturedDateCtrl.text,
        membraneRupturedTime: membraneRupturedTimeCtrl.text,
        fetalMovement: fetalMovementCtrl.text,
      );

      await motherProvider.postCurrentlabourHistory(
          val, utilityProvider.admissionInfoId);

      utilityProvider.currentIndex = 4;
      utilityProvider.setCurrentPageIndex = 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PartographFormUi(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Labour onset'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: labourOnsetDateCtrl,
                    decoration: const InputDecoration(
                      label: Text('Date'),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: labourOnsetTimeCtrl,
                    decoration: const InputDecoration(
                      label: Text('Time'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              items: const <DropdownMenuItem>[
                DropdownMenuItem(
                  child: Text('YES'),
                  value: 'YES',
                ),
                DropdownMenuItem(
                  child: Text('NO'),
                  value: 'NO',
                ),
              ],
              onChanged: (dynamic value) {
                membraneRupturedCtrl.text = value;
              },
              decoration: const InputDecoration(
                label: Text('Membranes ruptured'),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: membraneRupturedDateCtrl,
                    decoration: const InputDecoration(
                      label: Text('Date'),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: membraneRupturedTimeCtrl,
                    decoration: const InputDecoration(
                      label: Text('Time'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              items: const <DropdownMenuItem>[
                DropdownMenuItem(
                  child: Text('Present'),
                  value: 'Present',
                ),
                DropdownMenuItem(
                  child: Text('Absent'),
                  value: 'Absent',
                ),
              ],
              onChanged: (dynamic value) {
                fetalMovementCtrl.text = value;
              },
              decoration: const InputDecoration(
                label: Text('Fetal movements'),
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
    labourOnsetCtrl.dispose();
    labourOnsetDateCtrl.dispose();
    labourOnsetTimeCtrl.dispose();
    membraneRupturedCtrl.dispose();
    membraneRupturedDateCtrl.dispose();
    membraneRupturedTimeCtrl.dispose();
    fetalMovementCtrl.dispose();

    super.dispose();
  }
}
