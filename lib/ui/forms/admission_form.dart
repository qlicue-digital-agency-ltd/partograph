import 'package:flutter/material.dart';
import 'package:partograph/ui/widgets/form_submit_button.dart';
import 'package:partograph/ui/widgets/partograph_form_ui.dart';

class AdmissionForm extends StatefulWidget {
  const AdmissionForm({Key? key}) : super(key: key);

  @override
  State<AdmissionForm> createState() => _AdmissionFormState();
}

class _AdmissionFormState extends State<AdmissionForm> {
  late GlobalKey<FormState> formKey;

  late TextEditingController nameOfFacilityCtrl;
  late TextEditingController hospitalRegNoCtrl;
  late TextEditingController dateOfAdmissionCtrl;
  late TextEditingController timeOfAdmissionCtrl;
  late TextEditingController admittingNurseDoctorCtrl;
  late TextEditingController admitteedFromCtrl;
  late TextEditingController reasonForReferralCtrl;
  late TextEditingController dangerSignCtrl;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    nameOfFacilityCtrl = TextEditingController();
    hospitalRegNoCtrl = TextEditingController();
    dateOfAdmissionCtrl = TextEditingController();
    timeOfAdmissionCtrl = TextEditingController();
    admittingNurseDoctorCtrl = TextEditingController();
    admitteedFromCtrl = TextEditingController();
    reasonForReferralCtrl = TextEditingController();
    dangerSignCtrl = TextEditingController();
    super.initState();
  }

  void save() {
    if (formKey.currentState!.validate()) {
      
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
              controller: nameOfFacilityCtrl,
              decoration: const InputDecoration(
                label: Text('Name of healthy facility'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: hospitalRegNoCtrl,
              decoration: const InputDecoration(
                label: Text('Hospital Reg. No'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: dateOfAdmissionCtrl,
              decoration: const InputDecoration(
                label: Text('Date of Admission'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: timeOfAdmissionCtrl,
              decoration: const InputDecoration(
                label: Text('Time'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: admittingNurseDoctorCtrl,
              decoration: const InputDecoration(
                label: Text('Admitting nurse/doctor (name)'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: admitteedFromCtrl,
              decoration: const InputDecoration(
                label: Text('Admitted from'),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: reasonForReferralCtrl,
              decoration: const InputDecoration(
                label: Text('Reason for referral/management received'),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: dangerSignCtrl,
              decoration: const InputDecoration(
                label: Text('Danger signs & Risk factors'),
              ),
              maxLines: 3,
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
    nameOfFacilityCtrl.dispose();
    hospitalRegNoCtrl.dispose();
    dateOfAdmissionCtrl.dispose();
    timeOfAdmissionCtrl.dispose();
    admittingNurseDoctorCtrl.dispose();
    admitteedFromCtrl.dispose();
    reasonForReferralCtrl.dispose();
    dangerSignCtrl.dispose();
    super.dispose();
  }
}
