import 'package:flutter/material.dart';

class InitialExaminationForm extends StatelessWidget {
  const InitialExaminationForm({
    Key? key,
    required this.examinedByCtrl,
    required this.cadreCtrl,
  }) : super(key: key);

  final TextEditingController examinedByCtrl;
  final TextEditingController cadreCtrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            label: Text('Examined by (name)'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            label: Text('Cadre'),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
