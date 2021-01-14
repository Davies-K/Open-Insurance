import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/utils/utils.dart';

import 'riskInfo.dart';

class Computation extends StatefulWidget {
  @override
  _ComputationState createState() => _ComputationState();
}

class _ComputationState extends State<Computation> {
  List currencies = [
    {
      "id": "1",
      "item_code": "S4DD",
      "item_name": "Monitor LCD",
      "price": "100",
      "stock": "222"
    },
    {
      "id": "3",
      "item_code": "G567",
      "item_name": "Speaker Boom",
      "price": "1500000",
      "stock": "5"
    },
    {
      "id": "4",
      "item_code": "L009",
      "item_name": "CPU FANW",
      "price": "600000",
      "stock": "900"
    },
    {
      "id": "6",
      "item_code": "M366",
      "item_name": "Mouse Gaming",
      "price": "250000",
      "stock": "500"
    },
    {
      "id": "8",
      "item_code": "E34RF",
      "item_name": "Mobile Charger\t",
      "price": "120",
      "stock": "150"
    }
  ];
  String currency = "";
  List vehicleType = [];
  List policyType = [];
  final _compKey = GlobalKey<FormState>();

  TextEditingController _cubicCapacity;
  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ww * 0.04),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6.0,
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5.0)
                          ]),
                      child: Icon(Feather.arrow_left,
                          size: 25.0, color: Colors.white)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RiskInfo()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      Text(
                        'Risk Information',
                        style: fieldText(context)
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
            heightSpace1,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Premium Computation",
                    style: titleText(context).copyWith(
                        color: primarycolor,
                        fontSize: ww * 0.04,
                        fontWeight: FontWeight.bold))
              ],
            ),
            // heightSpace1,
            Form(
              key: _compKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dropdownWithLabel(
                      'Currency',
                      'Choose currency',
                      'Please choose a currency.',
                      currencies,
                      currency,
                      context),
                  dropdownWithLabel('Policy Type', 'Choose policy',
                      'Please choose a policy.', currencies, currency, context),
                  dropdownWithLabel('Vehicle Usage', 'Choose Usage',
                      'Please choose a usage.', currencies, currency, context),
                  inputWithLabel(
                      'Cubic Capacity',
                      'Measured in (cc)',
                      'Please provide the cubic capacity.',
                      _cubicCapacity,
                      'number',
                      context),
                  inputWithLabel(
                      'Year of Make',
                      'Enter year',
                      'Please enter the year of make',
                      _cubicCapacity,
                      'number',
                      context),
                  inputWithLabel('Start Date', '', 'Please provide the date.',
                      _cubicCapacity, 'number', context),
                  inputWithLabel('End Date', '', 'Please enter the date',
                      _cubicCapacity, 'number', context),
                  inputWithLabel(
                      'Car Value',
                      '',
                      'Please provide the price of car',
                      _cubicCapacity,
                      'number',
                      context),
                  inputWithLabel(
                      'Number of Seat',
                      '',
                      'Please provide the number of seat',
                      _cubicCapacity,
                      'number',
                      context),
                  dropdownWithLabel('NCD', 'Choose NCD', 'Please provide NCD.',
                      currencies, currency, context),
                  dropdownWithLabel('Buy Extra Tppd', 'Choose Tppd',
                      'Please provide Tppd.', currencies, currency, context),
                  inputWithLabel(
                      'Buy Back Excess',
                      '',
                      'Please provide Buy Back Excess',
                      _cubicCapacity,
                      'number',
                      context),
                  inputWithLabel('Premium', '', 'Please provide premium',
                      _cubicCapacity, 'number', context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        color: primarycolor,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_compKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
            /*  inputWithLabel('Cubic Capacity', 'Measured in (cc)',_cubicCapacity, 'number', context),
            inputWithLabel('Cubic Capacity', 'Measured in (cc)',_cubicCapacity, 'number', context),
            inputWithLabel('Cubic Capacity', 'Measured in (cc)',_cubicCapacity, 'number', context) */
          ],
        ),
      ),
    );
  }
}
