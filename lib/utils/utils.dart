import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro007/Constants/constants.dart';

const heightSpace1 = SizedBox(height: 14);
const smallSpace1 = SizedBox(height: 8);
const largeSpace1 = SizedBox(height: 28);

String incidentType = '';
DateTime incidentTime;
double mlongitude = 0;
double mlatitude = 0;
Image evidence;
String address = '';
String description = '';
String evidencePath = 'fghjff';
String validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value == null)
    return 'Enter a valid email address';
  else
    return null;
}

showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 15), child: Text("Processing...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

Widget inputWithLabel(String label, String placeholder, String error,
    TextEditingController controller, String keyBoardType, context) {
  var ww = MediaQuery.of(context).size.width;
  var hh = MediaQuery.of(context).size.height;
  var keyboardType;
  if (keyBoardType == 'number') {
    keyboardType = TextInputType.number;
  } else {
    keyboardType = TextInputType.text;
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      heightSpace1,
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(label, style: fieldText(context))],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: ww * 0.90,
            height: hh * 0.075,
            padding: EdgeInsets.only(top: ww * 0.02),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              // autocorrect: true,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: fieldText(context),
                filled: true,
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  borderSide: BorderSide(color: primarycolor, width: 0.5),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return error;
                }
                return null;
              },
            ),
          ),
        ],
      ),
      smallSpace1,
    ],
  );
}

dialog(double hh, double ww, String alert, BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)), //this right here
        child: Container(
          height: hh / 8,
          width: ww * 0.8,
          alignment: Alignment.center,
          child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                alert,
                style: semiBoldfieldText()
                    .copyWith(color: primarycolor, fontSize: 12),
              )),
        ),
      );
    },
  );
}

Widget dropdownWithLabel(String label, String placeholder, String error,
    List data, String selected, context) {
  var ww = MediaQuery.of(context).size.width;
  var hh = MediaQuery.of(context).size.height;

  return Column(
    children: [
      heightSpace1,
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(label, style: fieldText(context))],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: ww * 0.02),
            child: Container(
              width: ww * 0.9,
              height: hh * 0.065,
              child: FormField<String>(
                builder: (FormFieldState<String> state2) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        labelStyle: fieldText(context),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        hintText: error,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0))),
                    // isEmpty: selected == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selected,
                        isDense: true,
                        onChanged: (String newValue) {
                          // _getVehicleType(newValue);

                          selected = newValue;
                          state2.didChange(newValue);
                        },
                        /* items: data.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['item_name']),
                            value: item['id'].toString(),
                          );
                        }).toList(), */
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )
    ],
  );
}
