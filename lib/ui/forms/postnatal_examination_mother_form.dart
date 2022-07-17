import 'package:flutter/material.dart';

class PostnatalExaminationMotherForm extends StatelessWidget {
  const PostnatalExaminationMotherForm({
    Key? key,
    required this.temperatureCtrl,
    required this.pulseCtrl,
    required this.respirationCtrl,
    required this.bpCtrl,
    required this.eyeCtrl,
    required this.breastCtrl,
    required this.abdomenCtrl,
    required this.perineumBleedingCtrl,
    required this.perineumTearsCtrl,
    required this.legsCalfTendernessCtrl,
  }) : super(key: key);

  final TextEditingController temperatureCtrl;
  final TextEditingController pulseCtrl;
  final TextEditingController respirationCtrl;
  final TextEditingController bpCtrl;
  final TextEditingController eyeCtrl;
  final TextEditingController breastCtrl;
  final TextEditingController abdomenCtrl;
  final TextEditingController perineumBleedingCtrl;
  final TextEditingController perineumTearsCtrl;
  final TextEditingController legsCalfTendernessCtrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: temperatureCtrl,
          decoration: const InputDecoration(
            label: Text('Temperature'),
            suffix: Text('c'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: pulseCtrl,
          decoration: const InputDecoration(
            label: Text('Pulse'),
            suffix: Text('b/min'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: respirationCtrl,
          decoration: const InputDecoration(
              label: Text('Respiration'), suffix: Text('bpm')),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: bpCtrl,
          decoration: const InputDecoration(
            label: Text('BP'),
            suffix: Text('mmHg'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: eyeCtrl,
          decoration: const InputDecoration(
            label: Text('Eyes (parlor)'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: breastCtrl,
          decoration: const InputDecoration(
            label: Text('Breast'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: abdomenCtrl,
          decoration: const InputDecoration(
            label: Text('Abdomen (uterus)'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: perineumBleedingCtrl,
          decoration: const InputDecoration(
            label: Text('Perineum Bleeding'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: perineumTearsCtrl,
          decoration: const InputDecoration(
            label: Text('Perineum Tears'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: legsCalfTendernessCtrl,
          decoration: const InputDecoration(
            label: Text('Legs Calf tenderness'),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
