import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partograph/model/admission_informations.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/provider/utility_provider.dart';
import 'package:partograph/ui/widgets/buttons/custom_string_dropdown.dart';
import 'package:partograph/ui/widgets/partograph_form_ui.dart';
import 'package:partograph/ui/widgets/text_fields/date_text_field.dart';
import 'package:partograph/ui/widgets/text_fields/label_text_field.dart';
import 'package:partograph/ui/widgets/text_fields/time_text_field.dart';
import 'package:provider/provider.dart';

class AdmissionInformationScreen extends StatefulWidget {
  final Mother mother;
  const AdmissionInformationScreen({Key? key, required this.mother})
      : super(key: key);

  @override
  State<AdmissionInformationScreen> createState() =>
      _AdmissionInformationScreenState();
}

class _AdmissionInformationScreenState
    extends State<AdmissionInformationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _adimittedFrom = "ANTENATAL WARD";

  final FocusNode _reasonForReferralOrManagementReceivedFocusNode = FocusNode();
  final FocusNode _dangerSignsAndRiskFactorsFocusNode = FocusNode();
  final FocusNode _dateOfAdmissionFocusNode = FocusNode();
  final FocusNode _timeOfAdmissionFocusNode = FocusNode();

  final TextEditingController _timeOfAdmissionTextEditingController =
      TextEditingController();
  final TextEditingController _dateOfAdmissionTextEditingController =
      TextEditingController();
  final TextEditingController
      _reasonForReferralOrManagementReceivedTextEditingController =
      TextEditingController();
  final TextEditingController _dangerSignsAndRiskFactorsTextEditingController =
      TextEditingController();

  final GlobalKey<ScaffoldState> _createPersonalInfoScaffoldKey =
      GlobalKey<ScaffoldState>();

  void save() {
    final _mother = Provider.of<MotherProvider>(context, listen: false);
    final _utilityProvider =
        Provider.of<UtilityProvider>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      final _admissionInformation = AdmissionInformation(
        id: 0,
        dateOfAdmission: _dateOfAdmissionTextEditingController.text,
        admittingNurseDoctorName: 'Anesia',
        dangerSignsAndRiskFactors:
            _dangerSignsAndRiskFactorsTextEditingController.text,
        hospitalRegNo: 'MH00192',
        nameOfHealthFacility: 'Muhimbili',
        adimittedFrom: _adimittedFrom,
        reasonForReferralOrManagementReceived:
            _reasonForReferralOrManagementReceivedTextEditingController.text,
        time: _timeOfAdmissionTextEditingController.text,
      );

      _mother
          .postAdmissionInformation(_admissionInformation, widget.mother.id)
          .then((value) {
        if (value != null) {
          _dateOfAdmissionTextEditingController.clear();
          _dangerSignsAndRiskFactorsTextEditingController.clear();
          _reasonForReferralOrManagementReceivedTextEditingController.clear();

          //show the snackbar
          _utilityProvider.showInSnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              color: Colors.white,
              context: context,
              icon: Icons.check_circle,
              scaffoldKey: _createPersonalInfoScaffoldKey,
              title: 'Mother information created sucessfully');

          _utilityProvider.currentIndex = 1;
          _utilityProvider.setCurrentPageIndex = 1;
          _utilityProvider.setAdmissionInfoId = value.id;
        } else {
          //show the snackbar
          _utilityProvider.showInSnackBar(
              color: Colors.red,
              backgroundColor: Colors.black,
              context: context,
              icon: Icons.error,
              scaffoldKey: _createPersonalInfoScaffoldKey,
              title: 'Error while submitting creating');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PartographFormUi(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: DateTextfield(
                  prefixIcon: Icons.date_range,
                  message: 'Please enter date of admission',
                  maxLines: 1,
                  hitText: 'Date of admission',
                  labelText: 'Date of admission',
                  focusNode: _dateOfAdmissionFocusNode,
                  textEditingController: _dateOfAdmissionTextEditingController,
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: TimeTextfield(
                  prefixIcon: Icons.punch_clock,
                  message: 'Please enter time of admission',
                  maxLines: 1,
                  hitText: 'Time of admission',
                  labelText: 'Time of admission',
                  focusNode: _timeOfAdmissionFocusNode,
                  textEditingController: _timeOfAdmissionTextEditingController,
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CustomStringDropdown(
                  items: const ["HOME", "ANTENATAL WARD"],
                  onChange: (value) {
                    setState(() {
                      _adimittedFrom = value!;
                    });
                  },
                  value: _adimittedFrom,
                  title: 'Adimitted from',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: LabelTextfield(
                  prefixIcon: Icons.local_hospital,
                  message: 'Please enter reason  for referral',
                  maxLines: 5,
                  hitText: 'Write....',
                  labelText: 'Reasons for referral/management received',
                  focusNode: _reasonForReferralOrManagementReceivedFocusNode,
                  textEditingController:
                      _reasonForReferralOrManagementReceivedTextEditingController,
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: LabelTextfield(
                  prefixIcon: Icons.dangerous,
                  message: 'Please enter danger signs if any',
                  maxLines: 5,
                  hitText: 'Write....',
                  labelText: 'Danger signs & Risk factors',
                  focusNode: _dangerSignsAndRiskFactorsFocusNode,
                  textEditingController:
                      _dangerSignsAndRiskFactorsTextEditingController,
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Platform.isAndroid
                        ? MaterialButton(
                            color: Theme.of(context).primaryColor,
                            child: const Text(
                              'SAVE',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: save,
                          )
                        : CupertinoButton(
                            color: Theme.of(context).primaryColor,
                            child: const Text(
                              'SAVE',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: save,
                          ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timeOfAdmissionTextEditingController.dispose();
    _dateOfAdmissionTextEditingController.dispose();
    _reasonForReferralOrManagementReceivedTextEditingController.dispose();
    _dangerSignsAndRiskFactorsTextEditingController.dispose();
    super.dispose();
  }
}
