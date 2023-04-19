import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_value/theme/app_color.dart';
import 'package:social_value/utils/extension.dart';

class StartUpTextFiled extends StatefulWidget {
  const StartUpTextFiled({
    Key? key,
    this.textFieldOnPress,
    this.isPasswordValidator = false,
    this.isEmailValidator = false,
    this.isLoginPasswordValidator = false,
    this.isPhoneNumberValidator = false,
    this.obscureText = false,
    this.readOnly = false,
    this.titleName,
    this.maxLine,
    this.onFieldSubmitted,
    this.maxLength,
    this.validator,
    this.inputFormat,
    this.isShowBorder = true,
    this.controller,
    this.headingTextColor,
    this.textInputType,
    this.hintText,
    this.suffixIconOnPress,
    this.color,
    this.prefixIcon,
    this.hintTextColor,
    this.isCursorShow = true,
    this.borderColor,
    required this.headingText,
    this.needValidation = false,
    this.suffixSubIcon,
    this.validationMessage,
    this.fillColor,
    this.fontColor,
    this.onChange,
    this.enabled,
    this.onEditingComplete,
    this.isDarkHeading = false,
    this.textInputAction,
    this.suffixIconWidget,
  }) : super(key: key);
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Function(String)? onChange;
  final bool isPasswordValidator;
  final bool isEmailValidator;
  final bool isLoginPasswordValidator;
  final bool isPhoneNumberValidator;
  final String? titleName;
  final bool obscureText;
  final bool isDarkHeading;
  final int? maxLine;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Function? onEditingComplete;
  final Widget? suffixIconWidget;
  final Widget? suffixSubIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? validationMessage;
  final String headingText;
  final Function()? suffixIconOnPress;
  final Function()? textFieldOnPress;
  final FormFieldValidator<String>? validator;
  final Color? color;
  final Color? borderColor;
  final Color? headingTextColor;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color? fontColor;
  final bool needValidation;
  final bool isShowBorder;
  final bool isCursorShow;
  final bool? enabled;

  @override
  State<StartUpTextFiled> createState() => _StartUpTextFiledState();
}

class _StartUpTextFiledState extends State<StartUpTextFiled> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocus = false;

  void _onFocusChange() {
    setState(() {
      _isFocus = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // widget.headingText.is NotEmpty ? (20.0).addHSpace() : 0.0.addHSpace(),
        widget.headingText != ""
            ? widget.headingText.interTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontColor: widget.headingTextColor ?? Colors.black)
            : 0.0.addWSpace(),
        widget.headingText.isNotEmpty ? (12.0).addHSpace() : 0.0.addHSpace(),
        TextFormField(
          onTap: widget.textFieldOnPress,
          showCursor: widget.isCursorShow,
          autofocus: false,
          autocorrect: true,
          enabled: widget.enabled ?? true,
          // scrollPadding: EdgeInsets.only(bottom:  MediaQuery.of(context).viewInsets.bottom),
          readOnly: widget.readOnly,
          focusNode: _focusNode,
          onFieldSubmitted: (v) {
            // _focusNode.nextFocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (val) {
            if (widget.onChange != null) {
              widget.onChange!(val);
            }
          },

          maxLines: widget.maxLine ?? 1,
          // onFieldSubmitted: widget.onFieldSubmitted,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormat,
          obscureText: widget.obscureText,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          style: GoogleFonts.prompt(
              // fontFamily: 'Prompt',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: widget.fontColor ?? white),
          keyboardType: widget.textInputType ?? TextInputType.text,
          controller: widget.controller,
          cursorColor: widget.fontColor ?? Colors.white,
          validator: widget.validator,

          onEditingComplete: () {
            if (widget.onEditingComplete != null) {
              widget.onEditingComplete!();
            }
          },
          onSaved: (va) {
            FocusManager.instance.primaryFocus?.unfocus();
          },

          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon != null
                ? IconButton(
                    onPressed: () {},
                    icon: widget.prefixIcon ?? Container(),
                  )
                : null,
            suffixIcon: widget.suffixIconWidget != null
                ? IconButton(
                    onPressed: widget.suffixIconOnPress,
                    icon: widget.suffixIconWidget ?? Container(),
                  )
                : null,
            counterText: '',
            fillColor: widget.fillColor,
            filled: true,
            contentPadding:
                const EdgeInsets.only(left: 12, top: 14, bottom: 12, right: 0),
            isDense: true,
            hintText: widget.hintText,
            hintStyle:
                GoogleFonts.prompt(fontSize: 14, color: widget.hintTextColor),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 1,
                color: widget.borderColor == null
                    ? _isFocus
                        ? Colors.white
                        : Colors.white
                    : widget.borderColor!,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
            ),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 1,
                color: widget.borderColor == null
                    ? _isFocus
                        ? Colors.white
                        : Colors.white
                    : widget.borderColor!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 1,
                color: widget.borderColor == null
                    ? _isFocus
                        ? Colors.white
                        : Colors.white
                    : widget.borderColor!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
