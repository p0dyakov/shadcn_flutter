import 'package:shadcn_flutter/shadcn_flutter.dart';

extension TextEditingValueExtension on TextEditingValue {
  TextEditingValue replaceText(String newText) {
    var selection = this.selection;
    selection = selection.copyWith(
      baseOffset: selection.baseOffset.clamp(0, newText.length),
      extentOffset: selection.extentOffset.clamp(0, newText.length),
    );
    return TextEditingValue(
      text: newText,
      selection: selection,
    );
  }
}
