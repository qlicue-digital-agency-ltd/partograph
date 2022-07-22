import 'package:flutter/material.dart';
import 'package:partograph/model/dilatation.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:provider/provider.dart';

class DilatationForm extends StatefulWidget {
  const DilatationForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  State<DilatationForm> createState() => _DilatationFormState();
}

class _DilatationFormState extends State<DilatationForm> {
  final List<int> _labourProcessList = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  int _dilatation = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                _labourProcessList.length,
                (index) => RadioListTile<int>(
                  title: Text('${_labourProcessList[index]}'),
                  value: _labourProcessList[index],
                  groupValue: _dilatation,
                  onChanged: (int? value) {
                    setState(() {
                      _dilatation = value!;
                    });
                  },
                ),
              ),
            ),
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
                    final _motherProvider =
                        Provider.of<MotherProvider>(context, listen: false);

                    _motherProvider.postDilatation(
                        Dilatation(
                          time: DateTime.now().toUtc().toString(),
                          id: 0,
                          value: _dilatation,
                        ),
                        widget.mother);
                    Navigator.pop(context);
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
}
