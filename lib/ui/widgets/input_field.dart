import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'note_text.dart';


class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  final Function enterPressed;
  final bool smallVersion;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final String additionalNote;
  final Function(String) onChanged;
  final TextInputFormatter formatter;

  InputField(
      {@required this.controller,
        @required this.placeholder,
        this.enterPressed,
        this.fieldFocusNode,
        this.nextFocusNode,
        this.additionalNote,
        this.onChanged,
        this.formatter,
        this.validationMessage,
        this.textInputAction = TextInputAction.next,
        this.textInputType = TextInputType.text,
        this.password = false,
        this.isReadOnly = false,
        this.smallVersion = false});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPassword;
  double fieldHeight = 55;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: widget.smallVersion ? 40 : fieldHeight,
          alignment: Alignment.centerLeft,
          decoration:
          widget.isReadOnly ?BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,):
          BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white ,
          //border: Border.all(color: Colors.black26) ,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    keyboardType: widget.textInputType,
                    focusNode: widget.fieldFocusNode,
                    textInputAction: widget.textInputAction,
                    onChanged: widget.onChanged,
                    inputFormatters:
                    widget.formatter != null ? [widget.formatter] : null,
                    onEditingComplete: () {
                      if (widget.enterPressed != null) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        widget.enterPressed();
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (widget.nextFocusNode != null) {
                        widget.nextFocusNode.requestFocus();
                      }
                    },
                    obscureText: isPassword,
                    readOnly: widget.isReadOnly,

                    decoration: InputDecoration.collapsed(
                        hintText: widget.placeholder,
                        hintStyle:
                        TextStyle(fontSize: widget.smallVersion ? 12 : 15)),

                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    isPassword = !isPassword;
                  }),
                  child: widget.password
                      ? Container(
                      width: fieldHeight,
                      height: fieldHeight,
                      alignment: Alignment.center,
                      child: Icon(isPassword
                          ? Icons.visibility
                          : Icons.visibility_off))
                      : Container(),
                ),
              ],
            ),
          ),
        ),
        if (widget.validationMessage != null)
          NoteText(
            widget.validationMessage,
            color: Colors.red,
          ),
        if (widget.additionalNote != null) SizedBox(height: 5),
        if (widget.additionalNote != null) NoteText(widget.additionalNote),
        SizedBox(height: 10.0)
      ],
    );
  }
}