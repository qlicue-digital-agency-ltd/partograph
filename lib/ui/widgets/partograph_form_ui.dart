import 'package:flutter/material.dart';

class PartographFormUi extends StatelessWidget {
  const PartographFormUi({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }
}
