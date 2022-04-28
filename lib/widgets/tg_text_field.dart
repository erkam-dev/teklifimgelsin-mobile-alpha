import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TgTextField extends StatefulWidget {
  Widget label;
  String? prefixText;
  int? maxLength;
  FocusNode? focusNode;
  TextEditingController? textEditingController;

  TgTextField({
    Key? key,
    required this.label,
    this.prefixText,
    this.maxLength,
    this.focusNode,
    this.textEditingController,
  }) : super(key: key);

  @override
  State<TgTextField> createState() => _TgTextFieldState();
}

class _TgTextFieldState extends State<TgTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          label: widget.label,
          prefixText: widget.prefixText,
        ),
        style: const TextStyle(fontSize: 32),
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]'),
          ),
        ],
        maxLength: widget.maxLength,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
