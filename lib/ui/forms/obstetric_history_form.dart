import 'package:flutter/material.dart';

class ObstetricHistoryForm extends StatelessWidget {
  const ObstetricHistoryForm({
    Key? key,
    required this.gradivaCtrl,
    required this.parityCtrl,
    required this.livingChildrenCtrl,
    required this.abortionCtrl,
    required this.lnmpCtrl,
    required this.eddCtrl,
    required this.gaCtrl,
  }) : super(key: key);

  final TextEditingController gradivaCtrl;
  final TextEditingController parityCtrl;
  final TextEditingController livingChildrenCtrl;
  final TextEditingController abortionCtrl;
  final TextEditingController lnmpCtrl;
  final TextEditingController eddCtrl;
  final TextEditingController gaCtrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: gradivaCtrl,
          decoration: const InputDecoration(
            label: Text('Gravida'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: parityCtrl,
          decoration: const InputDecoration(
            label: Text('Parity'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: livingChildrenCtrl,
          decoration: const InputDecoration(
            label: Text('Living Children'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: abortionCtrl,
          decoration: const InputDecoration(
            label: Text('Abortion'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: lnmpCtrl,
          decoration: const InputDecoration(
            label: Text('LNMP'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: eddCtrl,
          decoration: const InputDecoration(
            label: Text('EDD'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: gaCtrl,
          decoration: const InputDecoration(
            label: Text('GA (in weeks)'),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
