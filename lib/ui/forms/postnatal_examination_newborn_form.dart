import 'package:flutter/material.dart';

class PostnatalExaminationBornForm extends StatelessWidget {
  const PostnatalExaminationBornForm({
    Key? key,
    required this.generalObservationCtrl,
    required this.weightCtrl,
    required this.lengthCtrl,
    required this.headCircumferenceCtrl,
    required this.anteriorFntanelleCtrl,
    required this.arvProphylaxisCtrl,
    required this.reflexesCtrl,
    required this.upperLimbsCtrl,
    required this.lowerLimbsCtrl,
    required this.chestAbdomenCtrl,
    required this.immunizationCtrl,
    required this.genitaliaCtrl,
    required this.backSpineCtrl,
    required this.stoolUrineCtrl,
    required this.oralCavityCtrl,
    required this.eyesCtrl,
    required this.commentsCtrl,
  }) : super(key: key);

  final TextEditingController generalObservationCtrl;
  final TextEditingController weightCtrl;
  final TextEditingController lengthCtrl;
  final TextEditingController headCircumferenceCtrl;
  final TextEditingController anteriorFntanelleCtrl;
  final TextEditingController arvProphylaxisCtrl;
  final TextEditingController reflexesCtrl;
  final TextEditingController upperLimbsCtrl;
  final TextEditingController lowerLimbsCtrl;
  final TextEditingController chestAbdomenCtrl;
  final TextEditingController immunizationCtrl;
  final TextEditingController genitaliaCtrl;
  final TextEditingController backSpineCtrl;
  final TextEditingController stoolUrineCtrl;
  final TextEditingController oralCavityCtrl;
  final TextEditingController eyesCtrl;
  final TextEditingController commentsCtrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: generalObservationCtrl,
          decoration: const InputDecoration(
            label: Text('General observation'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: weightCtrl,
          decoration: const InputDecoration(
            label: Text('Weight (kg)'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: lengthCtrl,
          decoration: const InputDecoration(
            label: Text('Length'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: headCircumferenceCtrl,
          decoration: const InputDecoration(
            label: Text('Head circumference'),
          ),
        ),
        const SizedBox(height: 20),
        DropdownButtonFormField(
          items: const <DropdownMenuItem>[
            DropdownMenuItem(
              child: Text('Open '),
              value: 'opened',
            ),
            DropdownMenuItem(
              child: Text('Closed'),
              value: 'closed',
            ),
          ],
          onChanged: (dynamic value) {
            anteriorFntanelleCtrl.text = value;
          },
          decoration: const InputDecoration(
            label: Text('Anterior Fntanelle'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: arvProphylaxisCtrl,
          decoration: const InputDecoration(
            label: Text('ARV Prophylaxis'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: reflexesCtrl,
          decoration: const InputDecoration(
            label: Text('Reflexes'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: upperLimbsCtrl,
          decoration: const InputDecoration(
            label: Text('Upper limbs'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: lowerLimbsCtrl,
          decoration: const InputDecoration(
            label: Text('Lower limbs'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: chestAbdomenCtrl,
          decoration: const InputDecoration(
            label: Text('Chest/Abdomen'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: immunizationCtrl,
          decoration: const InputDecoration(
            label: Text('Immunization'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: genitaliaCtrl,
          decoration: const InputDecoration(
            label: Text('Genitalia'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: backSpineCtrl,
          decoration: const InputDecoration(
            label: Text('Back/Spine'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: stoolUrineCtrl,
          decoration: const InputDecoration(
            label: Text('Stool/Urine'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: oralCavityCtrl,
          decoration: const InputDecoration(
            label: Text('Oral cavity'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: eyesCtrl,
          decoration: const InputDecoration(
            label: Text('Eyes'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: commentsCtrl,
          decoration: const InputDecoration(
            label: Text('Comments'),
          ),
          minLines: 3,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
