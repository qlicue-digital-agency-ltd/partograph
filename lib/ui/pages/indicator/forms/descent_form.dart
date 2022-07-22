import 'package:flutter/material.dart';
import 'package:partograph/model/descent.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:provider/provider.dart';

class DescentForm extends StatefulWidget {
  const DescentForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  State<DescentForm> createState() => _DescentFormState();
}

class _DescentFormState extends State<DescentForm> {
  final List<int> _labourProcessList = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  int _descent = 0;
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
                  groupValue: _descent,
                  onChanged: (int? value) {
                    setState(() {
                      _descent = value!;
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
                    _motherProvider.postDescent(
                        Descent(
                          time: DateTime.now().toUtc().toString(),
                          id: 0,
                          value: _descent,
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
