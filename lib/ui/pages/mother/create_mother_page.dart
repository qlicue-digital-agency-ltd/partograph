import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partograph/constants/enum.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/provider/utility_provider.dart';
import 'package:partograph/ui/widgets/text_fields/date_text_field.dart';
import 'package:partograph/ui/widgets/text_fields/label_text_field.dart';
import 'package:partograph/ui/widgets/text_fields/mobile_text_field.dart';
import 'package:provider/provider.dart';

class CreateMotherPage extends StatefulWidget {
  const CreateMotherPage({Key? key}) : super(key: key);

  @override
  State<CreateMotherPage> createState() => _CreateMotherPageState();
}

class _CreateMotherPageState extends State<CreateMotherPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ///Focus nodes
  final FocusNode _surnameFocusNode = FocusNode();
  final FocusNode _otherNamesFocusNode = FocusNode();
  final FocusNode _husbandPartnerNameFocusNode = FocusNode();
  final FocusNode _residenceFocusNode = FocusNode();
  final FocusNode _permanentAddressFocusNode = FocusNode();
  final FocusNode _nextOfKinFocusNode = FocusNode();
  final FocusNode _cellPhoneFocusNode = FocusNode();
  final FocusNode _dateOfBirthFocusNode = FocusNode();

  /// Text Editing Controller
  final TextEditingController _dateOfBirthTextEditingController =
      TextEditingController();
  final TextEditingController _surnameTextEditingController =
      TextEditingController();
  final TextEditingController _otherNamesTextEditingController =
      TextEditingController();
  final TextEditingController _husbandPartnerNameTextEditingController =
      TextEditingController();
  final TextEditingController _residenceTextEditingController =
      TextEditingController();
  final TextEditingController _permanentAddressTextEditingController =
      TextEditingController();
  final TextEditingController _nextOfKinTextEditingController =
      TextEditingController();
  final TextEditingController _cellPhoneTextEditingController =
      TextEditingController();

  final TextEditingController _categorTextEditingController =
      TextEditingController();

  final GlobalKey<ScaffoldState> _createPersonalInfoScaffoldKey =
      GlobalKey<ScaffoldState>();

  final _phoneFormFieldKey = GlobalKey<FormFieldState>();

  void _onSave() {
    final _utilityProvider =
        Provider.of<UtilityProvider>(context, listen: false);
    final _motherProvider = Provider.of<MotherProvider>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      final _mother = Mother(
        id: 0,
        surname: _surnameTextEditingController.text,
        otherNames: _otherNamesTextEditingController.text,
        dateOfBirth: _dateOfBirthTextEditingController.text,
        husbandPartnerName: _husbandPartnerNameTextEditingController.text,
        residence: _residenceTextEditingController.text,
        permanentAddress: _permanentAddressTextEditingController.text,
        nextOfKin: _nextOfKinTextEditingController.text,
        cellPhone: _utilityProvider.selectedCountry!.phoneCode +
            _cellPhoneTextEditingController.text
                .replaceAll('(', '')
                .replaceAll(')', '')
                .replaceAll('-', '')
                .replaceAll(' ', ''),
        admissionInformations: [],
        caseCategory: CaseCategory.incoming,
      );
      _motherProvider.postMother(_mother).then((value) {
        if (!value) {
          _surnameTextEditingController.clear();
          _categorTextEditingController.clear();
          //show the snackbar
          _utilityProvider.showInSnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              color: Colors.white,
              context: context,
              icon: Icons.check_circle,
              scaffoldKey: _createPersonalInfoScaffoldKey,
              title: 'Mother information created sucessfully');

          // refresh mothers list
          _motherProvider.loadMothers();

          Navigator.pop(context);
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
    final _utilityProvider = Provider.of<UtilityProvider>(context);

    return Scaffold(
      key: _createPersonalInfoScaffoldKey,
      appBar: AppBar(
        title: const Text('Personal Information'),
      ),
      body: SingleChildScrollView(
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
                  child: LabelTextfield(
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.text,
                    message: 'Please enter surname',
                    maxLines: 1,
                    hitText: 'eg. Kalungi',
                    labelText: 'Surname',
                    focusNode: _surnameFocusNode,
                    textEditingController: _surnameTextEditingController,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: LabelTextfield(
                    prefixIcon: Icons.person,
                    message: 'Please enter other names',
                    maxLines: 1,
                    hitText: 'e.g Maria Karen',
                    labelText: 'Other names',
                    focusNode: _otherNamesFocusNode,
                    textEditingController: _otherNamesTextEditingController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: DateTextfield(
                    prefixIcon: Icons.date_range,
                    message: 'Please enter date of birth',
                    maxLines: 1,
                    hitText: 'Date of birth',
                    labelText: 'Date of birth',
                    focusNode: _dateOfBirthFocusNode,
                    textEditingController: _dateOfBirthTextEditingController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: LabelTextfield(
                    prefixIcon: Icons.male,
                    message: 'Please enter husband/partner name',
                    maxLines: 1,
                    hitText: 'eg. Mr Alfredy',
                    labelText: 'Husband/Partner Name',
                    focusNode: _husbandPartnerNameFocusNode,
                    textEditingController:
                        _husbandPartnerNameTextEditingController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: LabelTextfield(
                    prefixIcon: Icons.house,
                    message: 'Please enter residence',
                    maxLines: 1,
                    hitText: 'eg. active street, sinza',
                    labelText: 'Residence',
                    focusNode: _residenceFocusNode,
                    textEditingController: _residenceTextEditingController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: LabelTextfield(
                    prefixIcon: Icons.house,
                    message: 'Please enter permanet address',
                    maxLines: 1,
                    hitText: 'eg. Salasala Kinondoni',
                    labelText: 'Parmanet Address',
                    focusNode: _permanentAddressFocusNode,
                    textEditingController:
                        _permanentAddressTextEditingController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: LabelTextfield(
                    prefixIcon: Icons.person_add,
                    message: 'Please enter next of kin',
                    maxLines: 1,
                    hitText: 'eg. Angel Mtui',
                    labelText: 'Next of kin',
                    focusNode: _nextOfKinFocusNode,
                    textEditingController: _nextOfKinTextEditingController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: MobileTextfield(
                      hitText: "eg. 715785672",
                      labelText: "Cell Phone",
                      focusNode: _cellPhoneFocusNode,
                      textEditingController: _cellPhoneTextEditingController,
                      maxLines: 1,
                      message: "Please enter cell phone number",
                      onCodeChange: (country) {
                        _utilityProvider.selectCountry = country;
                      },
                      keyboardType: TextInputType.phone,
                      onChange: (val) {},
                      formFieldKey: _phoneFormFieldKey,
                      country: _utilityProvider.selectedCountry!,
                    )),
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
                              onPressed: () => _onSave())
                          : CupertinoButton(
                              color: Theme.of(context).primaryColor,
                              child: const Text(
                                'SAVE',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () => _onSave(),
                            ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
