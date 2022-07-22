import 'package:flutter/material.dart';
import 'package:partograph/model/amniotic_fluid.dart';
import 'package:partograph/model/character.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/widgets/titled_header.dart';
import 'package:provider/provider.dart';

class AmnioticFuildForm extends StatefulWidget {
  const AmnioticFuildForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  State<AmnioticFuildForm> createState() => _AmnioticFuildFormState();
}

class _AmnioticFuildFormState extends State<AmnioticFuildForm> {
  Character? _liquior = amnioticFuildList[0];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const TitledHeader(
            title: "Amniotic fluid",
          ),
          ...List.generate(
            amnioticFuildList.length,
            (index) => RadioListTile<Character>(
              title: Text(amnioticFuildList[index].title),
              value: amnioticFuildList[index],
              groupValue: _liquior,
              onChanged: (Character? value) {
                setState(() {
                  _liquior = value;
                });
              },
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

                      _motherProvider.postAmniotiFluid(
                        AmnioticFluid(
                          time: TimeOfDay.now().toString(),
                          id: 0,
                          value: _liquior!.value,
                        ),
                        widget.mother,
                      );
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
      ),
    );
  }
}
