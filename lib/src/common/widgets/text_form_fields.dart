import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.mainLabel,
    this.hintText,
    this.inputType,
    this.inputFormatters,
    this.enabled = true,
    this.initialValue,
    this.onEditingComplete,
    this.onTap,
    this.labelStyle,
  });

  final String? Function(String?)? validator;
  // onchanged variable
  final Function(String)? onChanged;
  final String? mainLabel;
  final String? hintText;
  final String? initialValue;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final Function()? onEditingComplete;
  final Function()? onTap;

  final TextEditingController? controller;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(mainLabel.toString(), style: labelStyle ?? context.labelMedium),
        8.vGap,
        TextFormField(
          // title text form field
          controller: controller,
          enabled: enabled,
          keyboardType: inputType,
          inputFormatters: inputFormatters,
          initialValue: initialValue,
          cursorColor: context.colorScheme.secondary,
          decoration: InputDecoration(
            hintText: hintText.toString(),
            hintStyle: context.labelSmall.copyWith(
              // color: Colors.grey.shade700,
              color: context.theme.disabledColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: context.theme.disabledColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
          ),
          // validate field on user interaction

          validator: validator ??
              ((value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              }),

          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onTap: onTap,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
