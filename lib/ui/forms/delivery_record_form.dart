import 'package:flutter/material.dart';

class DeliveryRecordForm extends StatefulWidget {
  const DeliveryRecordForm({
    Key? key,
    required this.deliveryNumberCtrl,
    required this.dateOfBirthCtrl,
    required this.timeOfBirthCtrl,
    required this.sexCtrl,
    required this.methodOfDeliveryCtrl,
    required this.methodOfDeliveryForTwinCtrl,
    required this.birthWeightCtrl,
    required this.commentCtrl,
    required this.indicationForOperativeDeliveryCtrl,
    required this.deliveryConductedByCtrl,
    required this.designationCtrl,
    required this.supervisionByCtrl,
  }) : super(key: key);

  final TextEditingController deliveryNumberCtrl;
  final TextEditingController dateOfBirthCtrl;
  final TextEditingController timeOfBirthCtrl;
  final TextEditingController sexCtrl;
  final TextEditingController methodOfDeliveryCtrl;
  final TextEditingController methodOfDeliveryForTwinCtrl;
  final TextEditingController birthWeightCtrl;
  final TextEditingController commentCtrl;
  final TextEditingController indicationForOperativeDeliveryCtrl;
  final TextEditingController deliveryConductedByCtrl;
  final TextEditingController designationCtrl;
  final TextEditingController supervisionByCtrl;

  @override
  State<DeliveryRecordForm> createState() => _DeliveryRecordFormState();
}

class _DeliveryRecordFormState extends State<DeliveryRecordForm> {
  bool forTwin = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.deliveryNumberCtrl,
          decoration: const InputDecoration(
            label: Text('Delivery Number'),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.dateOfBirthCtrl,
                decoration: const InputDecoration(
                  label: Text('Date of birth'),
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: widget.timeOfBirthCtrl,
                decoration: const InputDecoration(
                  label: Text('Time of birth'),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        DropdownButtonFormField(
          items: const <DropdownMenuItem>[
            DropdownMenuItem(
              child: Text('MALE'),
              value: 'MALE',
            ),
            DropdownMenuItem(
              child: Text('FEMALE'),
              value: 'FEMALE',
            ),
          ],
          onChanged: (dynamic value) {
            widget.sexCtrl.text = value;
          },
          decoration: const InputDecoration(
            label: Text('Sex'),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField(
                items: const <DropdownMenuItem>[
                  DropdownMenuItem(
                    child: Text('SVD'),
                    value: 'SVD',
                  ),
                  DropdownMenuItem(
                    child: Text('BREECH'),
                    value: 'BREECH',
                  ),
                  DropdownMenuItem(
                    child: Text('LCVE'),
                    value: 'LCVE',
                  ),
                  DropdownMenuItem(
                    child: Text('CS'),
                    value: 'CS',
                  ),
                ],
                onChanged: (dynamic value) {
                  widget.methodOfDeliveryCtrl.text = value;
                },
                decoration: const InputDecoration(
                  label: Text('Method of delivery'),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('(For Twin)'),
                Checkbox(
                  value: forTwin,
                  onChanged: (bool? value) {
                    setState(() {
                      forTwin = value!;
                    });
                    widget.methodOfDeliveryForTwinCtrl.text = value! ? '1' : '';
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: widget.birthWeightCtrl,
          decoration: const InputDecoration(
            label: Text('Birth Weight'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: widget.commentCtrl,
          decoration: const InputDecoration(
            label: Text('Comments (twin/special situation)'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: widget.indicationForOperativeDeliveryCtrl,
          decoration: const InputDecoration(
            label: Text('Indication for operative delivery'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: widget.deliveryConductedByCtrl,
          decoration: const InputDecoration(
            label: Text('Delivery conducted by'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: widget.designationCtrl,
          decoration: const InputDecoration(
            label: Text('Designation'),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: widget.supervisionByCtrl,
          decoration: const InputDecoration(
            label: Text('Supervision by'),
            suffix: Text('(for students)'),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
