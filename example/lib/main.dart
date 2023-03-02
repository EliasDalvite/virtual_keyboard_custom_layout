import 'package:flutter/material.dart';
import 'package:virtual_keyboard_custom_layout/virtual_keyboard_custom.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Keyboard Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Virtual Keyboard Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Holds the text that user typed.
  String text = '';

  // True if shift enabled.
  bool shiftEnabled = false;

  // is true will show the numeric keyboard.
  bool isNumericMode = false;

  TextEditingController _controllerText = TextEditingController();

  @override
  void initState() {
    // _customLayoutKeys = CustomLayoutKeys();
    _controllerText = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(text),
            // Only for the Alphanumeric or Numeric alternatives.
            SwitchListTile(
              title: Text(
                'Keyboard Type = ${isNumericMode ? 'VirtualKeyboardType.Numeric' : 'VirtualKeyboardType.Alphanumeric'}',
              ),
              value: isNumericMode,
              onChanged: (val) {
                setState(() {
                  isNumericMode = val;
                });
              },
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              color: Colors.grey,
              child: VirtualKeyboard(
                  height: 300,
                  width: 1000,
                  textColor: Colors.black,
                  textController: _controllerText,
                  fontSize: 20,
                  type: VirtualKeyboardType.Custom,
                  keys: const [
                    [
                      "q",
                      "w",
                      "e",
                      "r",
                      "t",
                      "y",
                      "u",
                      "i",
                      "o",
                      "p",
                      "BACKSPACE"
                    ],
                    [
                      "a",
                      "s",
                      "d",
                      "f",
                      "g",
                      "h",
                      "j",
                      "k",
                      "l",
                      "ç",
                      "RETURN"
                    ],
                    ["SHIFT", "z", "x", "c", "v", "b", "n", "m", "SHIFT"],
                    [
                      "@",
                      "_",
                      "SPACE",
                      ".",
                      "@gmail.com",
                    ],
                  ],
                  onKeyPress: _onKeyPress),
            )
          ],
        ),
      ),
    );
  }

  /// Fired when the virtual keyboard key is pressed.
  _onKeyPress(VirtualKeyboardKey key) {
    if (key.text != null) {
      if (key.keyType == VirtualKeyboardKeyType.String) {
        text = text + (shiftEnabled ? key.capsText! : key.text!);
      } else if (key.keyType == VirtualKeyboardKeyType.Action) {
        switch (key.action) {
          case VirtualKeyboardKeyAction.Backspace:
            if (text.isEmpty) return;
            text = text.substring(0, text.length - 1);
            break;
          case VirtualKeyboardKeyAction.Return:
            text = '$text\n';
            break;
          case VirtualKeyboardKeyAction.Space:
            text = text + key.text!;
            break;
          case VirtualKeyboardKeyAction.Shift:
            shiftEnabled = !shiftEnabled;
            break;
          default:
        }
      }
    }
    // Update the screen
    setState(() {});
  }
}
