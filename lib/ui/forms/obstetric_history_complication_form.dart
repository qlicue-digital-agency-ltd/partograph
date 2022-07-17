import 'package:flutter/material.dart';

class ObstetricHistoryComplicationForm extends StatefulWidget {
  const ObstetricHistoryComplicationForm({Key? key}) : super(key: key);

  @override
  State<ObstetricHistoryComplicationForm> createState() =>
      _ObstetricHistoryComplicationFormState();
}

class _ObstetricHistoryComplicationFormState
    extends State<ObstetricHistoryComplicationForm> {
  final List<TextEditingController> _yearCtrl = [];

  final List<TextFormField> _yearFields = [];

  final List<TextEditingController> _complicationCtrl = [];

  final List<TextFormField> _complicationFields = [];

  final List<TextEditingController> _methodCtrl = [];

  final List<TextFormField> _methodFields = [];

  final List<TextEditingController> _aliveCtrl = [];

  final List<TextFormField> _aliveFields = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._listView(),
        const SizedBox(height: 20),
        ListTile(
          title: const Icon(
            Icons.add,
          ),
          onTap: () {
            final yearCtrl = TextEditingController();
            final complicationCtrl = TextEditingController();
            final methodCtrl = TextEditingController();
            final aliveCtrl = TextEditingController();

            final yearField = _generateTextFormField(yearCtrl, 'Year');
            final complicationField =
                _generateTextFormField(complicationCtrl, 'Complication');
            final methodField = _generateTextFormField(methodCtrl, 'Method');
            final aliveField = _generateTextFormField(aliveCtrl, 'Alive');

            setState(() {
              _yearCtrl.add(yearCtrl);
              _complicationCtrl.add(complicationCtrl);
              _methodCtrl.add(methodCtrl);
              _aliveCtrl.add(aliveCtrl);
              _yearFields.add(yearField);
              _complicationFields.add(complicationField);
              _methodFields.add(methodField);
              _aliveFields.add(aliveField);
            });
          },
        ),
      ],
    );
  }

  List<Widget> _listView() {
    final children = List.generate(
      _yearCtrl.length,
      (i) => Column(
        children: [
          _generateTextFormField(_yearCtrl[i], 'Year'),
          const SizedBox(height: 20),
          _generateTextFormField(_complicationCtrl[i], 'Complication'),
          const SizedBox(height: 20),
          _generateTextFormField(_methodCtrl[i], 'Method'),
          const SizedBox(height: 20),
          _generateTextFormField(_aliveCtrl[i], 'Alive'),
          const SizedBox(height: 20),
        ],
      ),
    ).toList();

    return children;
  }

  TextFormField _generateTextFormField(
      TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }

  @override
  void dispose() {
    for (var i = 0; i < _yearCtrl.length; i++) {
      _yearCtrl[i].dispose();
    }

    for (var i = 0; i < _complicationCtrl.length; i++) {
      _complicationCtrl[i].dispose();
    }

    for (var i = 0; i < _methodCtrl.length; i++) {
      _methodCtrl[i].dispose();
    }

    for (var i = 0; i < _aliveCtrl.length; i++) {
      _aliveCtrl[i].dispose();
    }
    super.dispose();
  }
}
