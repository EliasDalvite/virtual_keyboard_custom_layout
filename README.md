# vvirtual_keyboard_custom_layout

# About
A simple package for displaying a virtual keyboard independently of the Operational System, on devices like kiosks and ATMs. The library is written in Dart and has no native code dependancy.

This project was forked from `virtual_keyboard_multi_language` (which was forked from `virtual_keyboard` project). The multi_language version implemented the button to transition between two different set languages.
I choose to fork from the multi_language version because it was newer and with some more customizations.

# Goal
The dependency suited my project very well, but one little aspect of it made me fork it and publish a custom version. The problem was the lack of layouts/customizations I could do within the keyboard layout. I needed only a few keys from the two initial keyboard presets and couldn't personalize it the way I wanted.
Said that, in order to facilitate usage and for self-improvement, the idea of the package was created and done, and I'm very happy with the results.

<br>
<p align="center">
<img style="height:200px;" alt="FlutterBlue" src="https://github.com/EliasDalvite/virtual_keyboard_custom_layout/image01.png?raw=true" />
</p>
<br>
<p align="center">
<img style="height:200px;" alt="FlutterBlue" src="https://github.com/ahmed-eg/virtual_keyboard_multi_language/blob/master/screen4.png?raw=true" />
</p>
<br>
<p align="center">
<img style="height:200px;" alt="FlutterBlue" src="https://github.com/ahmed-eg/virtual_keyboard_multi_language/blob/master/screen2.png?raw=true" />
</p>
<hr>


## Reference

### VirtualKeyboard 
Flutter widget to show virtual keyboards.
```dart
// Keyboard Type: Can be Numeric, Alphanumeric or Custom.
VirtualKeyboardType type
```
```dart
// Callback for Key press event. Called with pressed `Key` object.
Function onKeyPress;
```
```dart
// Virtual keyboard height. Default is 300.
double height;
```
```dart
/// Virtual keyboard height. Default is full screen width
  double width;
```
```dart
// Color for key texts and icons.
Color textColor;
```
```dart
// Font size for keyboard keys.
double fontSize;;
```
```dart
// Only Caps letters enabled.
bool alwaysCaps;;
```
```dart
/// the custom layout for multi or single language
VirtualKeyboardLayoutKeys customLayoutKeys;
```
```dart
/// used for multi-languages with default layouts, the default is English only
/// will be ignored if customLayoutKeys is not null
List<VirtualKeyboardDefaultLayouts> defaultLayouts;
```
```dart
/// inverse the layout to fix the issues with right to left languages, default is false.
bool reverseLayout;
```

```dart
/// List of Lists of Strings which will be displayed in the keyboard. All need to be set as Strings.
/// If you place "sS1" inside a position, it will assume this value in the button and will insert
/// the entire string into the field.
/// If you place a upper case letter, it will never change it's value even using SHIFT. It also applies
/// on the previous case.
/// To use special actions, such as Shift, put "SHIFT" and it will input the expected icon with it's
/// functionality. Note that this only works with "BACKSPACE", "RETURN", "SHIFT", "SPACE" and "SWITCHLANGUAGE".
/// Unfortunately couldn't make Switch Language button work, but I left it there anyway.
bool keys;
```

### VirtualKeyboardType
enum of Available Virtual Keyboard Types.
```dart
// Numeric only.
VirtualKeyboardType.Numeric
```
```dart
// Alphanumeric: letters`[A-Z]` + numbers`[0-9]` + `@` + `.`.
VirtualKeyboardType.Alphanumeric
```

```dart
// All types + special ones as ["BACKSPACE", "RETURN", "SHIFT", "SPACE" and "SWITCHLANGUAGE"].
VirtualKeyboardType.Custom
```

### VirtualKeyboardKey
Virtual Keyboard key.
```dart
// The text of the key. 
String text
```
```dart
// The capitalized text of the key. 
String capsText;
```
```dart
// Action or String
VirtualKeyboardKeyType keyType;
```
```dart
// Action of the key.
VirtualKeyboardKeyAction action;
```
### VirtualKeyboardKeyType
Type for virtual keyboard key.

```dart
// Can be an action key - Return, Backspace, etc.
VirtualKeyboardKeyType.Action
```
```dart
// Keys that have text values - letters, numbers, comma ...
VirtualKeyboardKeyType.String
```

### VirtualKeyboardKeyAction
```dart
/// Virtual keyboard actions.
enum VirtualKeyboardKeyAction { Backspace, Return, Shift, Space }
```

## Usage

#### Show Custom keyboard with custom example
```dart
// Wrap the keyboard with Container to set background color.
Container(
            // Keyboard is transparent
            color: Colors.grey,
            child: VirtualKeyboard(
                // Default height is 300
                height: 350,
                // Default height is will screen width
                width: 600,
                // Default is black
                textColor: Colors.white,
                // Default 14
                fontSize: 20,
                // the layouts supported
                defaultLayouts = [VirtualKeyboardDefaultLayouts.English],
                // All types
                type: VirtualKeyboardType.Custom,
                // Layout separated by rows
                keys: const [
                    ["T", "E", "S", "T"],
                    ["C", "U", "S", "T", "O", "M"],
                    ["L", "A", "Y", "O", "U", "T"],
                    ["RETURN", "SHIFT", "BACKSPACE", "SPACE"],
                  ],
                // Callback for key press event
                onKeyPress: _onKeyPress),
          )
```

#### Show Alphanumeric keyboard with default view
```dart
// Wrap the keyboard with Container to set background color.
Container(
            // Keyboard is transparent
            color: Colors.deepPurple,
            child: VirtualKeyboard(
                // Default height is 300
                height: 350,
                // Default height is will screen width
                width: 600,
                // Default is black
                textColor: Colors.white,
                // Default 14
                fontSize: 20,
                // the layouts supported
                defaultLayouts = [VirtualKeyboardDefaultLayouts.English],
                // [A-Z, 0-9]
                type: VirtualKeyboardType.Alphanumeric,
                // Callback for key press event
                onKeyPress: _onKeyPress),
          )
```

#### Show Numeric keyboard with default view
```dart
Container(
            // Keyboard is transparent
            color: Colors.red,
            child: VirtualKeyboard(
                // [0-9] + .
                type: VirtualKeyboardType.Numeric,
                // Callback for key press event
                onKeyPress: (key) => print(key.text)),
          )
```

#### onKeyPressed event basic ussage example
```dart
// Just local variable. Use Text widget or similar to show in UI.
String text;

  /// Fired when the virtual keyboard key is pressed.
_onKeyPress(VirtualKeyboardKey key) {
if (key.keyType == VirtualKeyboardKeyType.String) {
    text = text + (shiftEnabled ? key.capsText : key.text);
} else if (key.keyType == VirtualKeyboardKeyType.Action) {
    switch (key.action) {
    case VirtualKeyboardKeyAction.Backspace:
        if (text.length == 0) return;
        text = text.substring(0, text.length - 1);
        break;
    case VirtualKeyboardKeyAction.Return:
        text = text + '\n';
        break;
    case VirtualKeyboardKeyAction.Space:
        text = text + key.text;
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
```

- [Elias Dalvite](https://github.com/EliasDalvite)
- [LICENSE - MIT](https://github.com/ahmed-eg/virtual_keyboard_multi_language/blob/master/LICENSE)

