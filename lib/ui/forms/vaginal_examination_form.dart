import 'package:flutter/material.dart';
import 'package:partograph/model/vaginal_examination.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/provider/utility_provider.dart';
import 'package:partograph/ui/widgets/partograph_form_ui.dart';
import 'package:provider/provider.dart';

class VaginalExaminationForm extends StatefulWidget {
  const VaginalExaminationForm({Key? key}) : super(key: key);

  @override
  State<VaginalExaminationForm> createState() => _VaginalExaminationFormState();
}

class _VaginalExaminationFormState extends State<VaginalExaminationForm> {
  late GlobalKey<FormState> formKey;

  late TextEditingController dateCtrl;
  late TextEditingController timeCtrl;
  late TextEditingController cervixStateCtrl;
  late TextEditingController cervixDilationCtrl;
  late TextEditingController presentingPartCtrl;
  late TextEditingController positionOfOcciputCtrl;
  late TextEditingController mouldingCtrl;
  late TextEditingController caputCtrl;
  late TextEditingController stationCtrl;
  late TextEditingController liquorCtrl;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    dateCtrl = TextEditingController();
    timeCtrl = TextEditingController();
    cervixStateCtrl = TextEditingController();
    cervixDilationCtrl = TextEditingController();
    presentingPartCtrl = TextEditingController();
    positionOfOcciputCtrl = TextEditingController();
    mouldingCtrl = TextEditingController();
    caputCtrl = TextEditingController();
    stationCtrl = TextEditingController();
    liquorCtrl = TextEditingController();
    super.initState();
  }

  void save() async {
    final utilityProvider =
        Provider.of<UtilityProvider>(context, listen: false);
    final motherProvider = Provider.of<MotherProvider>(context, listen: false);

    if (formKey.currentState!.validate()) {
      VaginalExamination val = VaginalExamination(
        date: dateCtrl.text,
        time: timeCtrl.text,
        cervixState: cervixStateCtrl.text,
        cervixDilation: cervixDilationCtrl.text,
        presentingPart: presentingPartCtrl.text,
        positionOfOcciput: positionOfOcciputCtrl.text,
        moulding: mouldingCtrl.text,
        caput: caputCtrl.text,
        station: stationCtrl.text,
        liquor: liquorCtrl.text,
      );

      await motherProvider.postVaginalExamination(
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: dateCtrl,
                    decoration: const InputDecoration(
                      label: Text('Date'),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: timeCtrl,
                    decoration: const InputDecoration(
                      label: Text('Time'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: cervixStateCtrl,
              decoration: const InputDecoration(
                label: Text('Cervix State'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: cervixDilationCtrl,
              decoration: const InputDecoration(
                label: Text('Cervix Dilation'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: presentingPartCtrl,
              decoration: const InputDecoration(
                label: Text('Presenting part'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: positionOfOcciputCtrl,
              decoration: const InputDecoration(
                label: Text('Position of occiput'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: mouldingCtrl,
              decoration: const InputDecoration(
                label: Text('Moulding'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: caputCtrl,
              decoration: const InputDecoration(
                label: Text('Caput'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: stationCtrl,
              decoration: const InputDecoration(
                label: Text('Station'),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              items: const <DropdownMenuItem>[
                DropdownMenuItem(
                  child: Text('Intact'),
                  value: 'Intact',
                ),
                DropdownMenuItem(
                  child: Text('Clear'),
                  value: 'Clear',
                ),
                DropdownMenuItem(
                  child: Text('Meconium'),
                  value: 'Meconium',
                ),
                DropdownMenuItem(
                  child: Text('Smell'),
                  value: 'Smell',
                ),
              ],
              onChanged: (dynamic value) {
                liquorCtrl.text = value;
              },
              decoration: const InputDecoration(
                label: Text('Liquor'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    dateCtrl.dispose();
    timeCtrl.dispose();
    cervixStateCtrl.dispose();
    cervixDilationCtrl.dispose();
    presentingPartCtrl.dispose();
    positionOfOcciputCtrl.dispose();
    mouldingCtrl.dispose();
    caputCtrl.dispose();
    stationCtrl.dispose();
    liquorCtrl.dispose();
    super.dispose();
  }
}
