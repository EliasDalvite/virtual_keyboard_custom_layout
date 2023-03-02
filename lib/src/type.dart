// ignore_for_file: constant_identifier_names

part of virtual_keyboard_custom_layout;

/// Available Virtual Keyboard Types:
/// `Numeric` - Numeric only.
/// `Alphanumeric` - Alphanumeric: letters`[A-Z]` + numbers`[0-9]` + `@` + `.`.
/// `Custom` - Customized matrix passed by parameter.
enum VirtualKeyboardType { Numeric, Alphanumeric, Custom }
