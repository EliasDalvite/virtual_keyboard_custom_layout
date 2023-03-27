import 'package:flutter/material.dart';
import 'package:virtual_keyboard_custom_layout/virtual_keyboard_custom_layout.dart';
import 'package:virtual_keyboard_custom_layout_example/types_keyboard.dart';

class KeyboardAux extends StatefulWidget {
  TextEditingController? controller;
  VirtualKeyboardType typeKeyboard;
  TypeLayout typeLayout;
  bool alwaysCaps;
  String text = "";
  KeyboardAux({
    Key? key,
    this.alwaysCaps = false,
    this.controller,
    this.typeLayout = TypeLayout.alphaEmail,
    required this.typeKeyboard,
  }) : super(key: key);

  @override
  State<KeyboardAux> createState() => _KeyboardAuxState();
}

bool shiftEnabled = false;

class _KeyboardAuxState extends State<KeyboardAux> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          color: const Color.fromARGB(192, 199, 199, 199),
          child: VirtualKeyboard(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            fontSize: 26,
            textColor: const Color.fromARGB(255, 0, 0, 0),
            textController: widget.controller,
            defaultLayouts: const [
              VirtualKeyboardDefaultLayouts.English,
            ],
            alwaysCaps: widget.alwaysCaps,
            borderColor: const Color.fromARGB(255, 151, 151, 151),
            type: widget.typeKeyboard,
            keys: (widget.typeKeyboard == VirtualKeyboardType.Custom)
                ? widget.typeLayout.keyboard
                : [],
            onKeyPress: onKeyPress,
          ),
        ),
      ),
    );
  }

  onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      widget.text = widget.text + (shiftEnabled ? key.capsText! : key.text!);
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (widget.text.isEmpty) return;
          widget.text = widget.text.substring(0, widget.text.length - 1);
          break;
        case VirtualKeyboardKeyAction.Return:
          widget.text = '${widget.text}\n';
          break;
        case VirtualKeyboardKeyAction.Space:
          widget.text = widget.text + key.text!;
          break;
        case VirtualKeyboardKeyAction.Shift:
          shiftEnabled = !shiftEnabled;
          break;
        default:
      }
    }
    // Update the screen
    setState(() {});
  }
}
