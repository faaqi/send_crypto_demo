import 'package:flutter/material.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';

/// {@template xs_text_form_field}
/// A Text field component that uses the material component [TextFormField].
/// All the underlaying props are available.
///
/// ```dart
/// SCTextFormField()
/// ```
/// {@endtemplate}
class SCTextFormField extends TextFormField {
  /// {@macro lb_text_form_field}
  SCTextFormField({
    super.key,
    super.controller,
    super.initialValue,
    super.keyboardType,
    super.textCapitalization,
    InputDecoration? decoration,
    String hintText = '',
    String? errorText,
    String? label,
    super.inputFormatters,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    super.validator,
    super.onChanged,
    super.onFieldSubmitted,
    super.obscureText,
    super.autofocus,
    super.textInputAction,
    super.autocorrect,
    bool super.enabled = true,
    FocusNode? focusNode,
    super.onSaved,
    int? maxlength,
    bool noOutlineBorder = false,
    super.readOnly,
    Widget? suffixIcon,
    Widget? prefix,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    EdgeInsets? contentPadding,
    super.onTap,
  }) : super(
          maxLength: maxlength,
          style: textStyle ?? SCTextStyle.bodyText1,
          cursorColor: SCColors.black,
          decoration: decoration ??
              (noOutlineBorder
                  ? InputDecoration(
                      labelText: label,
                      hintText: hintText,
                      prefix: prefix,
                      suffixIcon: suffixIcon,
                      suffixIconConstraints: const BoxConstraints(
                        maxHeight: 1,
                      ),
                      labelStyle: SCTextStyle.labelSmall.copyWith(
                        fontSize: focusNode == null
                            ? SCSpacing.md
                            : focusNode.hasFocus
                                ? SCSpacing.md
                                : SCSpacing.md,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        top: SCSpacing.xlg,
                        bottom: SCSpacing.xs,
                      ),
                    )
                  : InputDecoration(
                      prefixIcon: prefix,
                      errorText: errorText,
                      labelText: label,
                      hintText: hintText,
                      hintStyle: hintStyle,
                      contentPadding: contentPadding,
                      labelStyle: SCTextStyle.labelSmall,
                      border: _outlineInputBorder(),
                      focusedBorder: _outlineInputBorder(),
                      enabledBorder: _outlineInputBorder(),
                      disabledBorder: _outlineInputBorder(),
                    )),
        );

  /// {@macro lb_text_form_field}
  SCTextFormField.optionalLabel({
    super.key,
    super.controller,
    super.initialValue,
    super.keyboardType,
    super.textCapitalization,
    InputDecoration super.decoration,
    super.inputFormatters,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    super.validator,
    super.onChanged,
    super.onFieldSubmitted,
    super.obscureText,
    super.autofocus,
    super.textInputAction,
    super.autocorrect,
    super.style,
    bool super.enabled = true,
    super.focusNode,
    super.onSaved,
  });

  static OutlineInputBorder _outlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: SCColors.black,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          SCSpacing.sm,
        ),
      ),
    );
  }
}
