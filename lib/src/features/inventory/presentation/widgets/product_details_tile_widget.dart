import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_manager_admin/src/common/widgets/text_form_fields.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class ItemDetailsTileDivider extends StatelessWidget {
  const ItemDetailsTileDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.theme.disabledColor,
      thickness: 0.25,
      height: 30,
    );
  }
}

class ItemDetailsTile extends StatelessWidget {
  const ItemDetailsTile({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$label: ", style: context.bodySmall),
        20.hGap,
        Flexible(
          child: Text(
            value,
            style: context.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class EditableItemDetailsTile extends StatelessWidget {
  const EditableItemDetailsTile({
    super.key,
    required this.label,
    required this.value,
    required this.controller,
    this.valueWidget,
    this.inputType = TextInputType.text,
    this.inputFormatters = const [],
    this.onChanged,
  });
  final String label;
  final String value;
  final Widget? valueWidget;
  final TextEditingController controller;
  final TextInputType inputType;
  final List<TextInputFormatter> inputFormatters;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$label: ", style: context.bodySmall),
        20.hGap,
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: valueWidget ??
                    ItemDetailsCustomInputFormField(
                      controller: controller,
                      hintText: value,
                      inputType: inputType,
                      inputFormatters: inputFormatters,
                      onChanged: onChanged,
                    ),
                //  Text(
                //   value,
                //   style: context.bodyMedium,
                // ),
              ),
              // 4.hGap,
              // IconButton(
              //   icon: const Icon(
              //     Icons.edit,
              //     size: 20,
              //   ),
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
