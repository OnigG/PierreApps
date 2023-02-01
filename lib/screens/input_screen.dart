import 'package:flutter/material.dart';
import '../models/boltMaterialData.dart';
import '../models/coefficientOfFriction.dart';
import '../models/lb150.dart';
import 'dart:math';

import '../models/lb1500.dart';
import '../models/lb2500.dart';
import '../models/lb300.dart';
import '../models/lb600.dart';
import '../models/lb900.dart';
import '../models/pn16ff.dart';
import '../models/pn16rf.dart';
import '../models/pn21ff.dart';
import '../models/pn21rf.dart';
import '../models/pn35ff.dart';
import '../models/pn35rf.dart';

class InputScreen extends StatefulWidget {
  InputScreen({super.key});
  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
//controller
  final pressureController = TextEditingController();

  // Initial Selected Value
  String flangeClassValue = '150lb';
  String diametreValue = '';
  String boltClassValue = '';
  String betweenThreadsValue = '0.15';
  String bearingSurfaceValue = '0.15';
  num wml = 0;
  num yield50Percent = 0;
  num boltTorque50Percent = 0;
  num minForGasket = 0;
  String boltStreesOk = 'Any Error Please Restart the App';
  // List of flangesItems in our dropdown menu
  var flangesItems = <String>[
    '150lb',
    '300lb',
    '600lb',
    '900lb',
    '1500lb',
    '2500lb',
    'PN16RF',
    'PN16FF',
    'PN21RF',
    'PN21FF',
    'PN35RF',
    'PN35FF',
  ];

  var betweenThreadsItems = <String>[
    '0.08',
    '0.1',
    '0.12',
    '0.15',
    '0.2',
    '0.25',
    '0.3',
    '0.35',
    '0.4',
    '0.45'
  ];

  var bearingSurfaceItems = <String>[
    '0.08',
    '0.1',
    '0.12',
    '0.15',
    '0.2',
    '0.25',
    '0.3',
    '0.35',
    '0.4',
    '0.45'
  ];

  List<String> diametreItems = [];
  var boltClassItems = allBoltMaterialData.map((e) => e.boltClass).toList();

  // function for dropdown list
  List<String> diametreList(String diametre) {
    switch (diametre) {
      case '150lb':
        return allLb150.map((e) => e.nps.toString()).toList();
        break;
      case '300lb':
        return allLb300.map((e) => e.nps.toString()).toList();
        break;
      case '600lb':
        return allLb600.map((e) => e.nps.toString()).toList();
        break;
      case '900lb':
        return allLb900.map((e) => e.nps.toString()).toList();
        break;
      case '1500lb':
        return allLb1500.map((e) => e.nps.toString()).toList();
        break;
      case '2500lb':
        return allLb2500.map((e) => e.nps.toString()).toList();
        break;
      case 'PN16RF':
        return allPn16Rf.map((e) => e.nps.toString()).toList();
        break;
      case 'PN16FF':
        return allPn16Ff.map((e) => e.nps.toString()).toList();
        break;
      case 'PN21RF':
        return allPn21Rf.map((e) => e.nps.toString()).toList();
        break;
      case 'PN21FF':
        return allPn21Ff.map((e) => e.nps.toString()).toList();
        break;
      case 'PN35RF':
        return allPn35Rf.map((e) => e.nps.toString()).toList();
        break;
      case 'PN35FF':
        return allPn35Ff.map((e) => e.nps.toString()).toList();
        break;
      default:
        return ['error'];
    }
  }

  // function to call boltMaterialData
  BoltMaterialData boltMaterialList() {
    return allBoltMaterialData.firstWhere((e) => e.boltClass == boltClassValue);
  }

  double gasketfactor() {
    switch (flangeClassValue) {
      case '150lb':
        return 0.5;
        break;
      case '300lb':
        return 0.5;
        break;
      case '600lb':
        return 0.5;
        break;
      case '900lb':
        return 0.5;
        break;
      case '1500lb':
        return 0.5;
        break;
      case '2500lb':
        return 6.5;
        break;
      case 'PN16RF':
        return 1;
        break;
      case 'PN16FF':
        return 1;
        break;
      case 'PN21RF':
        return 3.7;
        break;
      case 'PN21FF':
        return 3.7;
        break;
      case 'PN35RF':
        return 3.7;
        break;
      case 'PN35FF':
        return 3.7;
        break;
      default:
        return 0;
    }
  }

  pressClass() {
    switch (flangeClassValue) {
      case '150lb':
        return allLb150;
        break;
      case '300lb':
        return allLb300;
        break;
      case '600lb':
        return allLb600;
        break;
      case '900lb':
        return allLb900;
        break;
      case '1500lb':
        return allLb1500;
        break;
      case '2500lb':
        return allLb2500;
        break;
      case 'PN16RF':
        return allPn16Rf;
        break;
      case 'PN16FF':
        return allPn16Ff;
        break;
      case 'PN21RF':
        return allPn21Rf;
        break;
      case 'PN21FF':
        return allPn21Ff;
        break;
      case 'PN35RF':
        return allPn35Rf;
        break;
      case 'PN35FF':
        return allPn35Ff;
        break;
      default:
        return 0;
    }
  }

  // calcualtion function
  void _calculateTap() {
    setState(() {
      final flange = flangeClassValue;
      double diametre = double.parse(diametreValue);
      num pressure = num.parse(pressureController.text);
      var boltClass = boltMaterialList();
      var gasket = gasketfactor();
      var pressureC = pressClass();

      var diameterTable = pressureC.firstWhere((i) => i.nps == diametre);
      num b = 2.52 * sqrt(((diameterTable.d3)! - (diameterTable.d2)!) / 2);
      num b0 = ((diameterTable.d3)! - (diameterTable.d2)!) / 2;
      num g = diameterTable.gasketF!;

      wml = double.parse((((0.785 * (pow(g, 2)) * pressure) +
                  (2 * b * pi * g * gasket * pressure)) /
              1000)
          .toStringAsFixed(2));

      num totalArea = (diameterTable.boltNo)! * (diameterTable.boltArea1)!;
      yield50Percent = (boltClass.boltYield * totalArea) / (2000);

      num boltStress = wml / totalArea * 1000;
      boltStress > (0.65 * boltClass.boltYield)
          ? boltStreesOk = 'Stress not ok'
          : boltStreesOk = 'Stress ok';

      var coeffientOfF = allCoefficientOfFrictionData.firstWhere(
          (e) => e.betweenThreads == double.parse(betweenThreadsValue));

      double bearingSurface() {
        switch (bearingSurfaceValue) {
          case '0.08':
            return coeffientOfF.o08;
            break;
          case '0.1':
            return coeffientOfF.o10;
            break;
          case '0.12':
            return coeffientOfF.o12;
            break;
          case '0.15':
            return coeffientOfF.o15;
            break;
          case '0.2':
            return coeffientOfF.o20;
            break;
          case '0.25':
            return coeffientOfF.o25;
            break;
          case '0.3':
            return coeffientOfF.o30;
            break;
          case '0.35':
            return coeffientOfF.o35;
            break;
          case '0.4':
            return coeffientOfF.o40;
            break;
          case '0.45':
            return coeffientOfF.o45;
            break;
          default:
            return 0;
        }
      }

      num kValue = bearingSurface();

      num maxSelect = 0;
      num minSelect = 0;
      wml > yield50Percent ? maxSelect = wml : maxSelect = yield50Percent;
      wml > yield50Percent ? minSelect = yield50Percent : minSelect = wml;

      boltTorque50Percent = double.parse(
          (maxSelect * kValue * diameterTable.metric! / (diameterTable.boltNo)!)
              .toStringAsFixed(2));
      minForGasket = double.parse(
          (minSelect * kValue * diameterTable.metric! / (diameterTable.boltNo)!)
              .toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
            "Pierre's Flange Bolting with 70 Shore Hardness Rubber Gaskets"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DropdownButtonFormField(
                  decoration: new InputDecoration(labelText: "Flange"),
                  // Initial Value
                  value: flangeClassValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of flangesItems
                  items: flangesItems.map((String flangesItems) {
                    return DropdownMenuItem(
                      value: flangesItems,
                      child: Text(flangesItems),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      flangeClassValue = newValue!;
                      diametreValue = diametreList(flangeClassValue).first;
                      diametreItems = diametreList(flangeClassValue);
                    });
                  },
                ),
                DropdownButtonFormField(
                  decoration: new InputDecoration(labelText: "Diametre"),
                  //Initial Value
                  value: diametreValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: diametreItems.map((String diametreItems) {
                    return DropdownMenuItem(
                      value: diametreItems,
                      child: Text(diametreItems),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      diametreValue = newValue!;
                    });
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Pressure(MPa)"),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  controller: pressureController,
                ),
                DropdownButtonFormField(
                  decoration: new InputDecoration(labelText: "Class of Bolts"),
                  // Initial Value
                  //value: diametreValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: boltClassItems.map((String boltClassItems) {
                    return DropdownMenuItem(
                      value: boltClassItems,
                      child: Text(boltClassItems),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      boltClassValue = newValue!;
                    });
                  },
                ),
                DropdownButtonFormField(
                    decoration:
                        new InputDecoration(labelText: "Between threads (μ)"),
                    value: betweenThreadsValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items:
                        betweenThreadsItems.map((String betweenThreadsItems) {
                      return DropdownMenuItem(
                        value: betweenThreadsItems,
                        child: Text(betweenThreadsItems),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        betweenThreadsValue = newValue!;
                      });
                    }),
                DropdownButtonFormField(
                    decoration:
                        new InputDecoration(labelText: "Bearing surface (μ)"),
                    value: bearingSurfaceValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items:
                        bearingSurfaceItems.map((String bearingSurfaceItems) {
                      return DropdownMenuItem(
                        value: bearingSurfaceItems,
                        child: Text(bearingSurfaceItems),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        bearingSurfaceValue = newValue!;
                      });
                    }),
                // TextButton(
                //   onPressed: () {
                //     _calculateTap();
                //   },
                //   child: Text("CAL"),
                // ),
                ElevatedButton(
                    onPressed: () => _calculateTap(),
                    child: Text('Calculation')),
                TextField(
                  decoration: InputDecoration(labelText: 'Wml (kN)'),
                  controller: TextEditingController(text: '$wml'),
                  readOnly: true,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '50% of Yeild (kN)'),
                  controller: TextEditingController(text: '$yield50Percent'),
                  readOnly: true,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '20% Bolt Torgue'),
                  controller:
                      TextEditingController(text: '$boltTorque50Percent'),
                  readOnly: true,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Min for Gasket'),
                  controller: TextEditingController(text: '$minForGasket'),
                  readOnly: true,
                ),
                Text('$boltStreesOk'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
