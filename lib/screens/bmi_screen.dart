import 'package:flutter/material.dart';
import 'package:flutterprojects/shared/bottom_navigation_bar.dart';
import 'package:flutterprojects/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  String result = '';
  final double fontSize = 18;

  late List<bool> isSelected;

  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;

  String heightMessage = '';
  String weightMessage = '';

  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    heightMessage =
        'Please insert your height in ${(isMetric) ? 'meters' : 'inches'} ';
    weightMessage =
        'Please insert your weight in ${(isMetric) ? 'kilos' : 'pounds'} ';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:  Text('Calculator')),
        drawer:  MenuDrawer(),
        bottomNavigationBar:  MyBottonNavigationBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            ToggleButtons(
              isSelected: isSelected,
              onPressed: toggleMeasure,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child:
                        Text('Metric', style: TextStyle(fontSize: fontSize))),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child:
                        Text('Imperial', style: TextStyle(fontSize: fontSize)))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: heightMessage)),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: weightMessage)),
            ),
            ElevatedButton(
                onPressed: findBMI,
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: fontSize),
                )),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                result,
                style: TextStyle(fontSize: fontSize),
              ),
            )
          ]),
        ));
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = ' your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }

    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
}
