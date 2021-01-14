import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  Payments({Key key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('No payments effected'),
      ),
    );
  }
}
