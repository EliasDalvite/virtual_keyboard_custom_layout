part of virtual_keyboard_custom_layout;

/// Keys for Virtual Keyboard's rows.
const List<List> _keyRowsNumeric = [
  // Row 1
  [
    '1',
    '2',
    '3',
  ],
  // Row 2
  [
    '4',
    '5',
    '6',
  ],
  // Row 3
  [
    '7',
    '8',
    '9',
  ],
  // Row 4
  [
    '.',
    '0',
  ],
];

/// Returns a list of `VirtualKeyboardKey` objects for Numeric keyboard.
List<VirtualKeyboardKey> _getKeyboardRowKeysNumeric(rowNum) {
  // Generate VirtualKeyboardKey objects for each row.
  return List.generate(_keyRowsNumeric[rowNum].length, (int keyNum) {
    // Get key string value.
    String key = _keyRowsNumeric[rowNum][keyNum];

    // Create and return new VirtualKeyboardKey object.
    return VirtualKeyboardKey(
      text: key,
      capsText: key.toUpperCase(),
      keyType: VirtualKeyboardKeyType.String,
    );
  });
}

/// Returns a list of `VirtualKeyboardKey` objects.
List<VirtualKeyboardKey> _getKeyboardRowKeys(
    VirtualKeyboardLayoutKeys layoutKeys, rowNum) {
  // Generate VirtualKeyboardKey objects for each row.
  return List.generate(layoutKeys.activeLayout[rowNum].length, (int keyNum) {
    // Get key string value.
    if (layoutKeys.activeLayout[rowNum][keyNum] is String) {
      String key = layoutKeys.activeLayout[rowNum][keyNum];

      // Create and return new VirtualKeyboardKey object.
      return VirtualKeyboardKey(
        text: key,
        capsText: key.toUpperCase(),
        keyType: VirtualKeyboardKeyType.String,
      );
    } else {
      var action =
          layoutKeys.activeLayout[rowNum][keyNum] as VirtualKeyboardKeyAction;
      return VirtualKeyboardKey(
          keyType: VirtualKeyboardKeyType.Action, action: action);
    }
  });
}

/// Returns a list of VirtualKeyboard rows with `VirtualKeyboardKey` objects.
List<List<VirtualKeyboardKey>> _getKeyboardRows(
    VirtualKeyboardLayoutKeys layoutKeys) {
  // Generate lists for each keyboard row.
  return List.generate(layoutKeys.activeLayout.length,
      (int rowNum) => _getKeyboardRowKeys(layoutKeys, rowNum));
}

// Creates and returns the list of `VirtualKeyboardKey` objects.
List<List<VirtualKeyboardKey>> _getKeyboardCustom(List<List> keys) {
  // Will contain the keyboard row keys.
  List<List<VirtualKeyboardKey>> rowKeys = [];

  // Generate lists for each keyboard row.
  // Here a simply used `for` for easier understanding.
  for (var i = 0; i < keys.length; i++) {
    rowKeys.add(_getKeyboardRowsCustom(keys[i]));
  }
  return rowKeys;
}

/// Returns a list of VirtualKeyboard rows with `VirtualKeyboardKey` objects
/// from the Custom values list.
List<VirtualKeyboardKey> _getKeyboardRowsCustom(List rowNum) {
  List<VirtualKeyboardKey> rowKeys = [];
  for (var i = 0; i < rowNum.length; i++) {
    switch (rowNum[i]) {
      case "BACKSPACE":
        rowKeys.add(VirtualKeyboardKey(
            keyType: VirtualKeyboardKeyType.Action,
            action: VirtualKeyboardKeyAction.Backspace));
        break;
      case "RETURN":
        rowKeys.add(VirtualKeyboardKey(
            keyType: VirtualKeyboardKeyType.Action,
            action: VirtualKeyboardKeyAction.Return));
        break;
      case "SHIFT":
        rowKeys.add(VirtualKeyboardKey(
            keyType: VirtualKeyboardKeyType.Action,
            action: VirtualKeyboardKeyAction.Shift));
        break;
      case "SPACE":
        rowKeys.add(VirtualKeyboardKey(
            keyType: VirtualKeyboardKeyType.Action,
            action: VirtualKeyboardKeyAction.Space));
        break;
      // Unfortunately couldn't make this work because of the deadline on
      // my private project.
      case "SWITCHLANGUAGE":
        rowKeys.add(VirtualKeyboardKey(
            keyType: VirtualKeyboardKeyType.Action,
            action: VirtualKeyboardKeyAction.SwitchLanguage));
        break;
      default:
        rowKeys.add(VirtualKeyboardKey(
          text: rowNum[i],
          capsText: rowNum[i].toUpperCase(),
          keyType: VirtualKeyboardKeyType.String,
        ));
    }
  }
  return rowKeys;
}

/// Returns a list of VirtualKeyboard rows with `VirtualKeyboardKey` objects.
List<List<VirtualKeyboardKey>> _getKeyboardRowsNumeric() {
  // Generate lists for each keyboard row.
  return List.generate(_keyRowsNumeric.length, (int rowNum) {
    // Will contain the keyboard row keys.
    List<VirtualKeyboardKey> rowKeys = [];

    // We have to add Action keys to keyboard.
    switch (rowNum) {
      case 3:
        // String keys.
        rowKeys.addAll(_getKeyboardRowKeysNumeric(rowNum));

        // Right Shift
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Backspace),
        );
        break;
      default:
        rowKeys = _getKeyboardRowKeysNumeric(rowNum);
    }

    return rowKeys;
  });
}
