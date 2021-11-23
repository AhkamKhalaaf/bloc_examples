import 'package:bloc_examples/controllers/app_config.dart';
import 'package:flutter/material.dart';

Widget textFormUi({  Widget? rightIcon,
  Widget? leftIcon,
 required TextEditingController textEditingController,
 required String hintText,
 required String errorText,
  FocusNode? ownFocusNode,
  FocusNode? nextFocusNode,
required  TextInputType textInputType,
  bool security=false,
  int? maxLines,
  int? minLines,
   double? paddingValue ,
  Function? function,
bool? enabled=true})
  {
  return TextFormField(enabled: enabled,onTap:()
  {function!();}

    , validator: (value) {
      if (value!.isEmpty) {
        return errorText;
      }
      return null;
    },
    keyboardType: textInputType,
    onFieldSubmitted: (_) {
     // FocusScope.of(context).requestFocus(nextFocusNode);
    },
    maxLines: maxLines,
    minLines: minLines,
    autocorrect: true,controller: textEditingController,
    obscureText: security,
    focusNode: ownFocusNode,      decoration: InputDecoration(
        prefixIcon: rightIcon,
        suffixIcon: leftIcon,
        contentPadding: const EdgeInsets.all(0.0),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        hintText: hintText),
    style: TextStyle(
        color: appConfig.colorText,
        fontSize: 12.0,
        fontWeight: FontWeight.w500),
  );
}
