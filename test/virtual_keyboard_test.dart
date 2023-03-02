import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_keyboard_custom_layout/virtual_keyboard_custom.dart';

void main() {
  test('creates keyboard widget with Alphanumeric type', () {
    List row1 = ["1", "2", "3"];
    List row2 = ["4", "5", "6"];
    List row3 = ["7", "8", "9"];
    final keyboard = VirtualKeyboard(
      type: VirtualKeyboardType.Custom,
      keys: [row1, row2, row3],
      onKeyPress: () => null,
    );
    expect(keyboard.type, VirtualKeyboardType.Custom);
  });
}
