import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/model/oxytocin.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/widgets/text_fields/custom_text.dart';
import 'package:provider/provider.dart';

class OxytocinForm extends StatefulWidget {
  const OxytocinForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  State<OxytocinForm> createState() => _OxytocinFormState();
}

class _OxytocinFormState extends State<OxytocinForm> {
  final _amountTextEditingController = TextEditingController();
  final _dropsTextEditingController = TextEditingController();

  final _formKeyOxytocin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _formKeyOxytocin,
            child: Column(
              children: [
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
                  labelText: 'Volume',
                  siUnit: "mm",
                  focusNode: FocusNode(),
                  textEditingController: _amountTextEditingController,
                  maxLines: 1,
                  message: 'volume is required',
                  keyboardType: TextInputType.number,
                  icon: Icons.water,
                  iconColor: Colors.blue,
                ),
                const Divider(),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Drops per minute"),
                    )
                  ],
                ),
                CustomTextfield(
                  hitText: 'eg. 5',
                  labelText: 'Drops',
                  siUnit: "dpm",
                  focusNode: FocusNode(),
                  textEditingController: _dropsTextEditingController,
                  maxLines: 1,
                  message: 'Drop is required',
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
                      if (_formKeyOxytocin.currentState!.validate()) {
                        final _motherProvider =
                            Provider.of<MotherProvider>(context, listen: false);

                        _motherProvider.postOxytocin(
                            Oxytocin(
                              time: DateTime.now().toUtc().toString(),
                              id: 0,
                              amount: double.parse(
                                  _amountTextEditingController.text),
                              drops:
                                  int.parse(_dropsTextEditingController.text),
                            ),
                            widget.mother);
                        Navigator.pop(context);
                      } else {}
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
    _amountTextEditingController.dispose();
    _dropsTextEditingController.dispose();
    super.dispose();
  }
}
