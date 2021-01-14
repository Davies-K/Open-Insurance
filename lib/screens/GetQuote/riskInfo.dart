import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/utils/utils.dart';

import 'insuredInfo.dart';

class RiskInfo extends StatefulWidget {
  @override
  _RiskInfoState createState() => _RiskInfoState();
}

class _RiskInfoState extends State<RiskInfo> {
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
  final _riskKey = GlobalKey<FormState>();

  final TextEditingController _cubicCapacity = new TextEditingController();
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
                     Navigator.push(context, MaterialPageRoute(builder: (context) => InsuredInfo()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      Text(
                        'Insured Information',
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
                Text("Risk Information",
                    style: titleText(context).copyWith(
                        color: primarycolor,
                        fontSize: ww * 0.04,
                        fontWeight: FontWeight.bold))
              ],
            ),
            // heightSpace1,
            Form(
              key: _riskKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputWithLabel(
                      'Registration No.',
                      'Number of Registration',
                      'Please provide the registration number.',
                      _cubicCapacity,
                      'normal',
                      context),
                  dropdownWithLabel(
                      'Vehicle Make',
                      'Make of vehicle',
                      'Please choose the vehicle make',
                      currencies,
                      currency,
                      context),
                  dropdownWithLabel(
                      'Vehicle Model',
                      'Model of vehicle',
                      'Please choose the vehicle model',
                      currencies,
                      currency,
                      context),
                  dropdownWithLabel('Vehicle Body Type', 'Body Type',
                      'Please choose the body', currencies, currency, context),
                  inputWithLabel(
                      'Engine Number',
                      'Number on engine',
                      'Please provide the engine number.',
                      _cubicCapacity,
                      'normal',
                      context),
                  inputWithLabel(
                      'Chasis Number',
                      'Number on chasis',
                      'Please provide the chasis number.',
                      _cubicCapacity,
                      'normal',
                      context),
                  inputWithLabel(
                      'Vehicle Color',
                      '',
                      'Please provide the color',
                      _cubicCapacity,
                      'number',
                      context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        color: primarycolor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Previous',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      RaisedButton(
                        color: primarycolor,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_riskKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('Processing Data')));
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
