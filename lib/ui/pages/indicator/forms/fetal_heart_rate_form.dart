import 'package:flutter/material.dart';
import 'package:partograph/model/heart_rate.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/widgets/text_fields/custom_text.dart';
import 'package:provider/provider.dart';

class FetalHeartRateForm extends StatefulWidget {
  const FetalHeartRateForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;

  @override
  State<FetalHeartRateForm> createState() => _FetalHeartRateFormState();
}

class _FetalHeartRateFormState extends State<FetalHeartRateForm> {
  final _formKey = GlobalKey<FormState>();

  final _fetalHeartRateTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextfield(
                hitText: 'eg. 100',
                labelText: 'Fetal Heart Rate',
                siUnit: "(bpm)",
                focusNode: FocusNode(),
                textEditingController: _fetalHeartRateTextEditingController,
                maxLines: 1,
                message: 'fetal heart rate is required',
                keyboardType: TextInputType.number,
                icon: Icons.favorite,
                iconColor: Colors.red,
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
                          if (_formKey.currentState!.validate()) {
                            final _motherProvider = Provider.of<MotherProvider>(
                                context,
                                listen: false);

                            _motherProvider.postHeartRate(
                              HeartRate(
                                time: DateTime.now().toString(),
                                id: 0,
                                value: double.parse(
                                  _fetalHeartRateTextEditingController.text,
                                ),
                              ),
                              widget.mother,
                            );
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
        ),
      ],
    );
  }

  @override
  void dispose() {
    _fetalHeartRateTextEditingController.dispose();
    super.dispose();
  }
}
