import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class SearchFormField extends FormField<String> {
  final TextEditingController? textEditingController;

  SearchFormField({
    Key? key,
    String? hint,
    int? maxLines = 1,
    int? maxLength = 1000,
    FormFieldSetter<String>? onSaved,
    TextInputType keyboardType = TextInputType.text,
    this.textEditingController,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    VoidCallback? onCancel,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? textInputFormatter,
    Color? backgroundColor,
    Color? borderColor,
    Color? hintColor,
    Color? textColor,
    Color? iconColor,
    bool? readOnly,
    Widget? suffixIcon,
  }) : super(
      key: key,
      onSaved: onSaved,
      validator: validator,
      builder: (field) {
        final state = field as SearchFormFieldState;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoTextField(
                autofocus: false,
                cursorColor: Colors.black,
                readOnly: readOnly ?? false,
                controller: state.textEditingController,
                textInputAction: TextInputAction.search,
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 16),
                maxLines: maxLines,
                maxLength: maxLength,
                placeholder: hint,
                placeholderStyle: TextStyle(
                    color: hintColor ?? const Color(0xff7A7A9D)),
                onChanged: (value) {
                  if (onChanged != null) {
                    onChanged(value);
                  }
                  field.didChange(value);
                },
                onEditingComplete: () {
                  FocusScope.of(field.context).unfocus();
                  if (onEditingComplete != null) {
                    onEditingComplete();
                  }
                },
                decoration: BoxDecoration(
                    color: backgroundColor ?? const Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(20)),
                style: TextStyle(fontSize: 14, color: hintColor ?? const Color(0xff7A7A9D)),
                inputFormatters: textInputFormatter,
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: InkWell(
                    onTap: () {
                      if (onEditingComplete != null) {
                        onEditingComplete();
                      }
                    },
                    child: SvgPicture.asset(
                      Assets.icons.icSearch2,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ),
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Material(
                    child: suffixIcon ??
                        (state.textEditingController.text.isNotEmpty
                            ? Padding(
                          padding: const EdgeInsets.all(8),
                          child: InkResponse(
                            radius: 16,
                            child: SvgPicture.asset(
                                Assets.icons.icRemoveText,
                                width: 16,
                                height: 16),
                            onTap: () {
                              // ignore: invalid_use_of_protected_member
                              state.setState(() {
                                state.textEditingController.clear();
                              });
                              if (onCancel != null) {
                                onCancel();
                              }
                            },
                          ),
                        )
                            : null),
                  ),
                )),
          ],
        );
      });

  @override
  FormFieldState<String> createState() {
    return SearchFormFieldState();
  }
}

class SearchFormFieldState extends FormFieldState<String> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = (widget as SearchFormField).textEditingController ??
        TextEditingController(text: widget.initialValue);
  }
}
