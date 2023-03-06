import 'package:flutter/material.dart';
import 'package:virtual_keyboard_custom_layout/virtual_keyboard_custom_layout.dart';
import 'package:virtual_keyboard_custom_layout_example/keyboard_aux.dart';
import 'package:virtual_keyboard_custom_layout_example/types_keyboard.dart';

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

  TextEditingController controllerField01 = TextEditingController();
  TextEditingController controllerField02 = TextEditingController();
  FocusNode focusField02 = FocusNode();

  // key variables to utilize the keyboard with the class KeyboardAux
  var isKeyboardVisible = false;
  var controllerKeyboard = TextEditingController();
  late TypeLayout typeLayout;

  @override
  void initState() {
    // Making the return function properly.
    controllerField01.addListener(() {
      if (controllerField01.value.text.endsWith("\n")) {
        controllerField01.text =
            controllerField01.value.text.replaceAll("\n", "");
        setState(() {
          controllerKeyboard = controllerField02;
          focusField02.requestFocus();
          typeLayout = TypeLayout.alphaEmail;
        });
      }
    });
    controllerField02.addListener(() {
      if (controllerField01.value.text.endsWith("\n")) {
        controllerField01.text =
            controllerField01.value.text.replaceAll("\n", "");
        setState(() {
          isKeyboardVisible = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isKeyboardVisible = false;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                // To prevent overflow with android and ios native keyboard
                keyboardType: TextInputType.none,
                controller: controllerField01,
                onTap: () {
                  setState(() {
                    isKeyboardVisible = true;
                    controllerKeyboard = controllerField01;
                    typeLayout = TypeLayout.alphabet;
                  });
                },
              ),
              TextFormField(
                keyboardType: TextInputType.none,
                controller: controllerField02,
                onTap: () {
                  setState(() {
                    isKeyboardVisible = true;
                    controllerKeyboard = controllerField02;
                    typeLayout = TypeLayout.alphaEmail;
                  });
                },
              ),
              Expanded(
                child: Container(),
              ),
              if (isKeyboardVisible)
                Stack(children: [
                  KeyboardAux(
                    controller: controllerKeyboard,
                    typeLayout: typeLayout,
                    typeKeyboard: VirtualKeyboardType.Custom,
                  ),
                ]),
            ],
          ),
        ),
      ),
    );
  }
}
