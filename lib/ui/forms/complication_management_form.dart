import 'package:flutter/material.dart';

class ComplicationManagementForm extends StatelessWidget {
  const ComplicationManagementForm({
    Key? key,
    required this.complicationManagementCtrl,
  }) : super(key: key);

  final TextEditingController complicationManagementCtrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: complicationManagementCtrl,
          decoration: const InputDecoration(
            label: Text('Complications / Management'),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
