import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/model/temperature.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/widgets/text_fields/custom_text.dart';
import 'package:provider/provider.dart';

class TemperatureForm extends StatefulWidget {
  const TemperatureForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;

  @override
  State<TemperatureForm> createState() => _TemperatureFormState();
}

class _TemperatureFormState extends State<TemperatureForm> {
  final _formKeyTemp = GlobalKey<FormState>();

  final _tempTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: _formKeyTemp,
          child: Column(
            children: [
              CustomTextfield(
                hitText: 'eg. 36.4',
                labelText: 'Temperature',
                siUnit: "℃",
                focusNode: FocusNode(),
                textEditingController: _tempTextEditingController,
                maxLines: 1,
                message: 'temperature is required',
                keyboardType: TextInputType.number,
                icon: Icons.thermostat,
                iconColor: Colors.cyan,
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
                          if (_formKeyTemp.currentState!.validate()) {
                            final _motherProvider = Provider.of<MotherProvider>(
                                context,
                                listen: false);
                            _motherProvider.postTemperature(
                                Temperature(
                                  time: DateTime.now().toUtc().toString(),
                                  id: 0,
                                  value: double.parse(
                                      _tempTextEditingController.text),
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
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tempTextEditingController.dispose();
    super.dispose();
  }
}
