import 'package:virtual_keyboard_custom_layout/virtual_keyboard_custom_layout.dart';

class CustomLayoutKeys extends VirtualKeyboardLayoutKeys {
  @override
  int getLanguagesCount() => 2;

  @override
  List<List> getLanguage(int index) {
    switch (index) {
      case 1:
        return _arabicLayout;
      default:
        return defaultEnglishLayout;
    }
  }
}

const List<List> _arabicLayout = [
  // Row 1
  [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ],
  // Row 2
  [
    'ض',
    'ص',
    'ث',
    'ق',
    'ف',
    'غ',
    'ع',
    'ه',
    'خ',
    'ح',
    'د',
    VirtualKeyboardKeyAction.Backspace
  ],
  // Row 3
  [
    'ش',
    'س',
    'ي',
    'ب',
    'ل',
    'ا',
    'ت',
    'ن',
    'م',
    'ك',
    'ط',
    VirtualKeyboardKeyAction.Return
  ],
  // Row 4
  [
    'ذ',
    'ئ',
    'ء',
    'ؤ',
    'ر',
    'لا',
    'ى',
    'ة',
    'و',
    '.',
    'ظ',
    VirtualKeyboardKeyAction.Shift
  ],
  // Row 5
  [
    VirtualKeyboardKeyAction.SwitchLanguage,
    '@',
    VirtualKeyboardKeyAction.Space,
    '-',
    '_',
  ]
];
