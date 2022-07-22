import 'package:flutter/material.dart';
import 'package:partograph/model/drug_iv_fluids.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/ui/pages/indicator/forms/drugs_iv_fluid_form.dart';
import 'package:partograph/ui/widgets/titled_header_button.dart';

class DrugsIvFluidCard extends StatelessWidget {
  const DrugsIvFluidCard(
      {Key? key, required this.drugIvFluid, required this.mother})
      : super(key: key);
  final List<DrugIvFluid> drugIvFluid;
  final Mother mother;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TitledHeaderButton(
                title: "Drugs given & IV fluids",
                onPressed: () {
                  drugsShowDialogForm(context);
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
                          'Description',
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
                  itemCount: drugIvFluid.length,
                  itemBuilder: (_, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: Text(drugIvFluid[index].value)),
                        Expanded(
                            child: Text(
                          drugIvFluid[index].time,
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
    );
  }

  drugsShowDialogForm(context) {
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
              const Expanded(child: Text("Drugs given & IV fluids")),
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
          content: DrugsIvFluidForm(
            mother: mother,
          ),
        );
      },
    );
  }
}
