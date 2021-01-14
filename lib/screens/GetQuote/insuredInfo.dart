import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/utils/utils.dart';

class InsuredInfo extends StatefulWidget {
  @override
  _InsuredInfoState createState() => _InsuredInfoState();
}

class _InsuredInfoState extends State<InsuredInfo> {
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
  bool ischecked = false;

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
                    if (_riskKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text('Processing Data')));
                          }
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => InsuredInfo()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Done',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      Text(
                        'Completed',
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
                Text("Insured Information",
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
                      'Input Search',
                      'Search',
                      'Please input to search.',
                      _cubicCapacity,
                      'normal',
                      context),
                  
                  inputWithLabel(
                      'Client Code',
                      '',
                      'Please provide the client code.',
                      _cubicCapacity,
                      'normal',
                      context),
                  inputWithLabel(
                      'First Name',
                      '',
                      'Please provide client first name.',
                      _cubicCapacity,
                      'normal',
                      context),
                  inputWithLabel(
                      'Last Name',
                      '',
                      'Please provide client last name.',
                      _cubicCapacity,
                      'normal',
                      context),
                  inputWithLabel(
                      'Other Name',
                      '',
                      'Please provide client other name.',
                      _cubicCapacity,
                      'normal',
                      context),
                  inputWithLabel(
                      'Mobile',
                      '',
                      'Please provide the phone number',
                      _cubicCapacity,
                      'number',
                      context),
                  inputWithLabel(
                      'Date of Birth',
                      '',
                      'Please provide the DOB',
                      _cubicCapacity,
                      'number',
                      context),
                  inputWithLabel(
                      'Email',
                      '',
                      'Please provide email.',
                      _cubicCapacity,
                      'normal',
                      context),
                   dropdownWithLabel(
                     'ID Type',
                      '',
                      'Please provide the id.', currencies, currency, context),
                  inputWithLabel(
                      'ID Number',
                      '',
                      'Please provide the id number.',
                      _cubicCapacity,
                      'number',
                      context),
                   Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  
                  Container(
                    height: ww * 0.10,
                    width: ww * 0.10,
                    child: Checkbox(
                        value: ischecked,
                        checkColor: Colors.white, // color of tick Mark
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          print(value);
                          // setState(() {
                          //   ischecked = value;
                          // });
                          if (value == true) {
                            // _processFavorite();
                          }
                          // _processFavorite();
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Column(
                        children: <Widget>[
                          Text('I agree to the terms of service.',
                              style: fieldText(context)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
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
                          'Submit',
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
