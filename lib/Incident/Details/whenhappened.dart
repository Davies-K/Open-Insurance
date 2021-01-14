import 'package:flutter/material.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:pro007/utils/utils.dart';

class WhenHappened extends StatefulWidget {
  @override
  _WhenHappenedState createState() => _WhenHappenedState();
}

class _WhenHappenedState extends State<WhenHappened> {
  var _selectedValue;
  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 18.0),
      child: SizedBox(
        width: ww * 0.85,
        height: 300.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("When it Occurred.",
                style: titleText(context).copyWith(
                    color: primarycolor,
                    fontSize: ww * 0.065,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: hh * 0.05),
            Container(
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                    incidentTime = date;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
