import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class AppTextFormField extends FormField<String> {
  final TextEditingController? textEditingController;
  final bool obscureText;
  AppTextFormField({
    bool usePhone = false,
    String? value,
    FocusNode? focusNode,
    Key? key,
    String? initialValue,
    String? title,
    String? labelText,
    Widget? action,
    String? hint,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool autoValidate = false,
    bool enabled = true,
    bool selected = false,
    bool readOnly = false,
    Widget? suffix,
    Widget? icon,
    Widget? prefix,
    bool filled = false,
    AutovalidateMode? autovalidateMode,
    this.obscureText = true,
    this.textEditingController,
    bool isPassword = false,
    TextInputType? inputType,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    int? maxLine,
    onTap,
    bool myAutoValidate = false,
    bool alwaysValidate = false,
    ValueChanged<String>? onChanged,
    int? minLines,
    bool? autoFocus,
    TextStyle? hintStyle,
  }) : super(
      key: key,
      validator: validator,
      onSaved: onSaved,
      initialValue: initialValue,
      autovalidateMode: alwaysValidate
          ? AutovalidateMode.always
          : myAutoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      builder: (FormFieldState field) {
        AppTextFormFieldState state = field as AppTextFormFieldState;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(state.context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w600),
                    ),
                    if (action != null) action
                  ],
                ),
              ),
            TextField(
              key: key,
              focusNode: focusNode,
              readOnly: readOnly,
              minLines: minLines ?? 1,
              maxLines: maxLine ?? 1,
              autofocus: autoFocus ?? false,
              cursorColor: Colors.black,
              controller: textEditingController,
              obscureText: isPassword ? state._obscureText : false,
              style: Theme.of(state.context).textTheme.bodyText1!.copyWith(
                color: readOnly ? const Color(0xff7A7A9D) : Colors.black,
              ),
              keyboardType: inputType,
              inputFormatters: [...inputFormatters??[],LengthLimitingTextInputFormatter(maxLength),],
              onChanged: (text) {
                state.didChange(text);
                if (onChanged != null) {
                  onChanged(text);
                }
              },
              decoration: const InputDecoration()
                  .applyDefaults(
                  Theme.of(state.context).inputDecorationTheme)
                  .copyWith(
                  fillColor: readOnly ? const Color(0xffF2F2F2) : null,
                  hintText: hint,
                  hintStyle: hintStyle,
                  labelText: labelText,
                  suffixIcon: isPassword
                      ? Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Material(
                      color: Colors.white,
                      child: InkResponse(
                        radius: 21,
                        child: state._obscureText
                            ? Assets.icons.icEyeClose
                            .image(width: 20)
                            : const Icon(Icons.visibility,
                            color: Color(0xff7A7A9D)),
                        onTap: () {
                          state.onChangeObscureText();
                        },
                      ),
                    ),
                  )
                      : state.textEditingController.text
                      .isNotEmpty && !readOnly
                      ? Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Material(
                      color: Colors.white,
                      child: InkResponse(
                          radius: 21,
                          onTap: () {
                            state.textEditingController
                                .clear();
                          },
                          child: Assets.icons.icClose
                              .image(width: 14, height: 14)),
                    ),
                  )
                      : null,
                  errorText: state.errorText,
                  enabled: enabled,
                  counterStyle: TextStyle(height: 0, fontSize: 0),
                  prefixIcon: usePhone
                      ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset(
                          Assets.icons.icFlagVn),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '+84',
                        style: Theme.of(state.context)
                            .textTheme
                            .bodyText1,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      SvgPicture.asset(
                        Assets.icons.icLine,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  )
                      : null),
            ),
          ],
        );
      });
  @override
  AppTextFormFieldState createState() => AppTextFormFieldState();
}

class AppTextFormFieldState extends FormFieldState<String> {
  late TextEditingController textEditingController;

  late bool _obscureText;

  void onChangeObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  AppTextFormField get widget => super.widget as AppTextFormField;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    textEditingController = widget.textEditingController ??
        TextEditingController(text: widget.initialValue);
  }
}
