// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SharedTextField extends StatelessWidget {
  final hintText;
  final hintTextColor;
  final labelTextColor;
  final labelText;
  final helperText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChange;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final focusNode;
  final controller;

  final int? maxLength;
  final hasBorder;
  final borderColor;
  final hasShadow;
  final prefixIcon;
  final Widget? suffixIcon;
  final obsecure;
  final TextStyle? inputTextStyle;
  final width;
  final height;
  final int? maxLines;
  final bool isAutoValidate;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final void Function()? onTap;
  final bool readOnly;
  const SharedTextField({
    super.key,
    this.maxLines,
    this.width,
    this.height,
    this.onChange,
    this.hintText,
    this.hintTextColor,
    this.labelTextColor,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.focusNode,
    this.maxLength = 500,
    this.textInputAction,
    this.controller,
    this.keyboardType,
    this.hasBorder = false,
    this.borderColor,
    this.hasShadow = false,
    this.prefixIcon,
    this.suffixIcon,
    this.obsecure = false,
    this.isAutoValidate = true,
    this.textDirection,
    this.inputTextStyle,
    this.inputFormatters,
    this.autofocus = false,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        color: borderColor ?? Colors.grey[200],
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        readOnly: readOnly,
        onTap: onTap,
        maxLines: maxLines ?? 1,
        autofocus: autofocus,
        controller: controller,
        textDirection: textDirection,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obsecure,
        focusNode: focusNode,
        style: inputTextStyle,
        onChanged: onChange,
        // maxLength: maxLength,
        textAlignVertical: TextAlignVertical.center,
        //cursorHeight: 20,
        decoration: InputDecoration(
          fillColor: Color(0xFFedf0f8),
          filled: true,
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          //  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
          ),
        ),
        onSaved: onSaved,
        validator: validator,
        autovalidateMode: isAutoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
