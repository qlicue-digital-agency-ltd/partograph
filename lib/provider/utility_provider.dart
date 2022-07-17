import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:partograph/model/indicator.dart';

class UtilityProvider with ChangeNotifier {
  UtilityProvider();
  List<Indicator> get indicatorList => _indicatorList;
  Country? _country = Country.tryParse("Tanzania");
  int _currentIndex = 0;

  int _admissionInfoId = 0;
  int _obstetricHistoryId = 0;

  final _controller = PageController();
  PageController get controller => _controller;
  int get admissionInfoId => _admissionInfoId;
  int get obstetricHistoryId => _obstetricHistoryId;
  Country? get selectedCountry => _country;
  int get currentIndex => _currentIndex;
  
  set selectCountry(Country country) {
    _country = country;
    notifyListeners();
  }

  set setAdmissionInfoId(int id) {
    _admissionInfoId = id;
    notifyListeners();
  }

  set setObstetricHistoryId(int id) {
    _obstetricHistoryId = id;
    notifyListeners();
  }

  set setCurrentPageIndex(int index) {
    _controller.jumpToPage(index);
    notifyListeners();
  }

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  selectIndicator(Indicator indicator) {
    for (var element in _indicatorList) {
      {
        element.isSelected = false;
      }
    }
    _indicatorList.firstWhere(((element) => element == indicator)).isSelected =
        true;
    notifyListeners();
  }

  ///snackbar
  void showInSnackBar(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required String title,
      required IconData icon,
      required Color color,
      required Color backgroundColor}) {
    final snackBar = SnackBar(
      content: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

List<Indicator> _indicatorList = <Indicator>[
  Indicator(
      icon: 'assets/icons/heart-attack.png',
      title: 'Fetal heart rate',
      isSelected: true),
  Indicator(icon: 'assets/icons/fetus.png', title: 'Amniotic fluid & Moulding'),
  Indicator(icon: 'assets/icons/pregnant.png', title: 'Labour Progress'),
  Indicator(icon: 'assets/icons/balloon.png', title: "Mother's condition"),
];
