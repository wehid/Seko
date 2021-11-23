import 'package:flutter/material.dart';

class SekoTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final bool isPassword;
  final Function validator;
  final TextInputType textInputType;
  final Function(String) onChange;

  SekoTextFormField({
    this.label,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
    this.validator,
    this.textInputType = TextInputType.text,
    this.onChange,
  });

  @override
  _SekoTextFormFieldState createState() => _SekoTextFormFieldState();
}

class _SekoTextFormFieldState extends State<SekoTextFormField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        onChanged: widget.onChange,
        maxLines: widget.textInputAction == TextInputAction.newline? 3:1,
        validator: widget.validator,
        textInputAction: widget.textInputAction,
        obscureText: widget.isPassword? hidePassword:false,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: hidePassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
