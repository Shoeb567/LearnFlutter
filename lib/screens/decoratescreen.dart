import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/homescreen.dart';
class DecorateScreen extends StatelessWidget {
  outlineborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 3.0),
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    );
  }

  focusborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2.0),
      borderRadius: BorderRadius.circular(25.0),
    );
  }
  demo(IconData  icon,hint){
    return InputDecoration(
      enabledBorder: outlineborder(),
      errorBorder: outlineborder(),
      focusedBorder: focusborder(),
      focusedErrorBorder: outlineborder(),
      border: OutlineInputBorder(),
      prefixIcon: Icon(
        icon,
        size: 25.0,
        color: Colors.black,
      ),
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.brown,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
