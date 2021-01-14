import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const primarycolor = Color.fromRGBO(150,21,29, 1);

const textColor = Color.fromRGBO(0, 0, 14, 1);
const inactiveColor = Colors.grey;
const activeColor = primarycolor;
const activeColorShade = Colors.blueGrey;
const whiteColor = Colors.white;
const kGoogleApiKey = "AIzaSyAlWZ8kI_0VwkHK4aANjtheyp4hm4pCmsY";
var uuid = Uuid();
String v1 = uuid.v1();
// Generate a v1 (time-based) id
BuildContext reportContext;

String mv1 = '';

TextStyle semiBoldfieldText() {
  return TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

String motor_detail = 'i-INSURE has the best claim settlement experience. '
    'Our claims processing and settlement procedure is very simple, fast and customer friendly.'
    ' The Company offers three main types of Motor insurance policies:';

String travel_detail =
    'The Travel Policy is designed to guarantee your security'
    ' and peace of mind against foreign travel uncertainties;'
    ' including emergency medical expenses, evacuation and assistance.';

String fire_detail =
    'This policy is designed to pay compensation to you for Loss of/or Damage to physical'
    ' assets owned by you. The perils covered are as follows:';

String NA_alert = 'Feature coming soon';

String token =
    "AAAAIl3GvqE:APA91bEJ3NkSzL6YrdyTfuEVXJPSjgve5qs_h3cX8MA82mrU2HetPRxf_";

var travel_points = [
  "Maximum insured age : 80 years old.",
];
var motor_points = [
  "COMPREHENSIVE :   This gives the widest cover. It gives indemnity in respect of accidental collision, fire, selfignition, lightening, burglary, malicious damage and damage whilst in transit by rail, inland water-way, lift or elevator",
  "THIRD PARTY FIRE AND THEFT :    This policy insures the vehicle itself against: Loss or damage caused by fire or theft in addition to the insured's legal liability to third-parties.",
  "THIRD PARTY :   Covers the insured’s legal liability for injury to or death of third parties and damage to third party property such as vehicles, buildings, kiosks, traffic lights etc. It does not however extend to a passenger's luggage, bags, wristwatches and other personal effects."
];
var fire_points = [
  'Fire',
  'Lightening Strike',
  'Explosion',
  'Electrical Damage ',
  ' Flood  ',
  'malicious damage',
];

TextStyle headerText() {
  return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: whiteColor);
}

TextStyle paragraphText() {
  return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.normal,
      fontSize: 13,
      color: textColor);
}

TextStyle smallTextLabel() {
  return TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    fontSize: 11,
    color: textColor,
  );
}

titleText(context) {
  var ww = MediaQuery.of(context).size.width;

  return TextStyle(
    fontSize: ww * 0.05,
    fontFamily: "Gilroy",
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

fieldText(context) {
  var ww = MediaQuery.of(context).size.width;
  return TextStyle(
    fontSize: ww * 0.035,
    fontWeight: FontWeight.w300,
    fontFamily: "Gilroy",
    color: textColor,
  );
}
