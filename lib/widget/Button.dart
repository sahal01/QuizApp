import 'package:flutter/material.dart';

import '../../styles/Styles.dart';


class Button {
  button({required Function action, required String txt,required BuildContext context,required color}) {
    return FlatButton(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          txt,
          style: Styles()
              .normalS(fontW: FontWeight.normal, fontS: 15, color: Colors.white),
        ),
        onPressed: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          action();
        });
  }
}
