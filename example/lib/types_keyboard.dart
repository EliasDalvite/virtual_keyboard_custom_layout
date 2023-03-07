/// alphabet: all letters, return, backspace, shift, space.
/// numeric: 0-9, return, backspace.
/// alphaEmail: all letters, 0-9, [. - _ @], @gmail.com.
enum TypeLayout { alphabet, numeric, alphaEmail }

extension TypeLayoutExtension on TypeLayout {
  List<List> get keyboard {
    switch (this) {
      case TypeLayout.alphabet:
        return [
          ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "BACKSPACE"],
          ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ç", "RETURN"],
          ["SHIFT", "z", "x", "c", "v", "b", "n", "m", "SHIFT"],
          ["SPACE"],
        ];
      case TypeLayout.numeric:
        return [
          ["1", "2", "3"],
          ["4", "5", "6"],
          ["7", "8", "9"],
          ["BACKSPACE", "0", "RETURN"],
        ];
      case TypeLayout.alphaEmail:
        return [
          ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
          ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "BACKSPACE"],
          ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ç", "RETURN"],
          ["SHIFT", "z", "x", "c", "v", "b", "n", "m", "SHIFT"],
          [
            ".",
            "~",
            "!",
            "%",
            "^",
            "&",
            "*",
            "=",
            "+",
            "{",
            "}",
            "'",
            "?",
            "-"
          ],
          ["@hotmail.com", "@", "SPACE", "_", "@gmail.com"],
        ];
      default:
        return [];
    }
  }
}
