import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/pages/indicator/forms/amniotic_fluid_form.dart';
import 'package:partograph/ui/pages/indicator/forms/moduling_form.dart';
import 'package:partograph/ui/widgets/titled_header_button.dart';
import 'package:provider/provider.dart';

class AmnioticFuildList extends StatelessWidget {
  const AmnioticFuildList({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  Widget build(BuildContext context) {
    final _motherProvider = Provider.of<MotherProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TitledHeaderButton(
                    title: "Amniotic fluid",
                    onPressed: () {
                      amnioticShowDialogForm(context);
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Row(
                          children: const [
                            Text(
                              'State of liquor',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: const [
                            Spacer(),
                            Text(
                              'Time',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.end,
                            ),
                            Icon(
                              Icons.lock_clock,
                              color: Colors.green,
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _motherProvider.motherList
                          .firstWhere((element) => element == mother)
                          .admissionInformations
                          .last
                          .partograph!
                          .amnioticFluid
                          .length,
                      itemBuilder: (_, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: Text(_motherProvider.motherList
                                    .firstWhere((element) => element == mother)
                                    .admissionInformations
                                    .last
                                    .partograph!
                                    .amnioticFluid[index]
                                    .value)),
                            Expanded(
                                child: Text(
                              '${_motherProvider.motherList.firstWhere((element) => element == mother)..admissionInformations.last.partograph!.amnioticFluid[index].time}',
                              textAlign: TextAlign.end,
                            ))
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TitledHeaderButton(
                    title: "Moulding of fetal skull",
                    onPressed: () {
                      mouldingShowDialogForm(context);
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Row(
                          children: const [
                            Text(
                              'Degree of moulding',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: const [
                            Spacer(),
                            Text(
                              'Time',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.end,
                            ),
                            Icon(
                              Icons.lock_clock,
                              color: Colors.green,
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _motherProvider.motherList
                          .firstWhere((element) => element == mother)
                          .admissionInformations
                          .last
                          .partograph!
                          .mouldingFetal
                          .length,
                      itemBuilder: (_, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: Text(_motherProvider.motherList
                                    .firstWhere((element) => element == mother)
                                    .admissionInformations
                                    .last
                                    .partograph!
                                    .mouldingFetal[index]
                                    .value)),
                            Expanded(
                                child: Text(
                              '${_motherProvider.motherList.firstWhere((element) => element == mother)..admissionInformations.last.partograph!.mouldingFetal[index].time}',
                              textAlign: TextAlign.end,
                            ))
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  amnioticShowDialogForm(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Amniotic fluid")),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          scrollable: true,
          content: AmnioticFuildForm(
            mother: mother,
          ),
        );
      },
    );
  }

  mouldingShowDialogForm(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("Moulding of fetal skull")),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          content: ModulingForm(
            mother: mother,
          ),
        );
      },
    );
  }
}
