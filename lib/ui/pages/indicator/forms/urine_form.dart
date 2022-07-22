import 'package:flutter/material.dart';
import 'package:partograph/model/character.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/model/urine.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/widgets/text_fields/custom_text.dart';
import 'package:provider/provider.dart';

class UrineForm extends StatefulWidget {
  const UrineForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  State<UrineForm> createState() => _UrineFormState();
}

class _UrineFormState extends State<UrineForm> {
  final _urineTextEditingController = TextEditingController();

  final _formKeyUrine = GlobalKey<FormState>();

  Character? _proteins = urineList[0];

  Character? _acetone = urineList[0];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _formKeyUrine,
            child: Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Protein"),
                    )
                  ],
                ),
                ...List.generate(
                  urineList.length,
                  (index) => RadioListTile<Character>(
                    title: Text(urineList[index].title),
                    value: urineList[index],
                    groupValue: _proteins,
                    onChanged: (Character? value) {
                      setState(() {
                        _proteins = value;
                      });
                    },
                  ),
                ),
                const Divider(),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Acetone"),
                    )
                  ],
                ),
                ...List.generate(
                  urineList.length,
                  (index) => RadioListTile<Character>(
                    title: Text(urineList[index].title),
                    value: urineList[index],
                    groupValue: _acetone,
                    onChanged: (Character? value) {
                      setState(() {
                        _acetone = value;
                      });
                    },
                  ),
                ),
                const Divider(),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Volume"),
                    )
                  ],
                ),
                CustomTextfield(
                  hitText: 'eg. 36.4',
                  labelText: 'Urine',
                  siUnit: "mm",
                  focusNode: FocusNode(),
                  textEditingController: _urineTextEditingController,
                  maxLines: 1,
                  message: 'urine is required',
                  keyboardType: TextInputType.number,
                  icon: Icons.water,
                  iconColor: Colors.blue,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKeyUrine.currentState!.validate()) {
                        final _motherProvider =
                            Provider.of<MotherProvider>(context, listen: false);
                        _motherProvider.postUrine(
                            Urine(
                              time: DateTime.now().toUtc().toString(),
                              id: 0,
                              volume: double.parse(
                                  _urineTextEditingController.text),
                              acetone: _acetone!.value,
                              protein: _proteins!.value,
                            ),
                            widget.mother);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _urineTextEditingController.dispose();
    super.dispose();
  }
}
