import 'package:flutter/material.dart';

class ShowAlerts{

  showAlertCircular(BuildContext context){
    return showDialog(context: context, builder: (context){
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
            height: 100,
            child: const Center(child: CircularProgressIndicator())),
      );
    });
  }
}
