import 'package:flutter/material.dart';


import '../styles/Styles.dart';


class Textformfield {
  radiusT({
    required double w,
    required TextEditingController controller,
    required TextInputType kType,
    required String hint,
    required Function() onT,
    required bool read,
  }) {
    return SizedBox(
      height: 40,
      width: w/2,
      child: TextFormField(
        textCapitalization: TextCapitalization.characters,
        onTap: onT,
        readOnly: read,
        controller: controller,
        keyboardType: kType,
        style: Styles().normalS(
            fontW: FontWeight.w400,
            fontS: 14,
            color: black),
        decoration:inputdecoration(
          hint: hint,
        ),
      ),
    );
  }
  }


  validator({required String text}){
    return
          (value) {
        if (value == null || value.isEmpty) {
          return text;
        }
      };

  }


  inputdecoration({required String hint}){
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),

      hintText: hint,
      hintStyle: const TextStyle(fontSize: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide:  BorderSide(
          color: Colors.blueGrey,
          width: 1.0,
        ),
      ),

    );
  }

