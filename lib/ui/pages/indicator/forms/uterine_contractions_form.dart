import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/model/uterine_contractions.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/widgets/text_fields/custom_text.dart';
import 'package:provider/provider.dart';

class UterineContractionsForm extends StatefulWidget {
  const UterineContractionsForm({Key? key, required this.mother})
      : super(key: key);
  final Mother mother;

  @override
  State<UterineContractionsForm> createState() =>
      _UterineContractionsFormState();
}

class _UterineContractionsFormState extends State<UterineContractionsForm> {
  final _formKey = GlobalKey<FormState>();

  final _uterineContractionsTextEditingController = TextEditingController();

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
                  hitText: 'eg. 20',
                  labelText: 'Uterine contractions',
                  siUnit: "(Sec)",
                  focusNode: FocusNode(),
                  textEditingController:
                      _uterineContractionsTextEditingController,
                  maxLines: 1,
                  message: 'fetal heart rate is required',
                  keyboardType: TextInputType.number,
                  icon: Icons.favorite,
                  iconColor: Colors.cyan),
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
                    if (_formKey.currentState!.validate()) {
                      final _motherProvider =
                          Provider.of<MotherProvider>(context, listen: false);
                      _motherProvider.postUterineContractions(
                          UterineContraction(
                            time: DateTime.now().toUtc().toString(),
                            id: 0,
                            value: int.parse(
                                _uterineContractionsTextEditingController.text),
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
    );
  }

  @override
  void dispose() {
    _uterineContractionsTextEditingController.dispose();
    super.dispose();
  }
}
