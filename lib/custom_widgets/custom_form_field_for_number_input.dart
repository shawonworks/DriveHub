import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class CustomFormFieldForNumberInput extends StatefulWidget {
  final bool numeric;
  final String fromTitle;
  final Widget? hintText;
  final int maxLine;
  final int? minLines;
  final TextEditingController? textController;

  final void Function(Country countrySelect) onChangeCountry;
  final Color? backgroundColor;
  final double? borderRadius;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;

  const CustomFormFieldForNumberInput({
    super.key,
    this.fromTitle = "",
    this.numeric = true,
    this.hintText,
    this.maxLine = 1,
    this.minLines,
    this.backgroundColor,
    this.textController,
    this.borderRadius,
    this.textInputAction,
    this.focusNode,
    this.keyboardType,
    required this.onChangeCountry,
  });

  @override
  State<CustomFormFieldForNumberInput> createState() => _CustomFormFieldForNumberInputState();
}

class _CustomFormFieldForNumberInputState extends State<CustomFormFieldForNumberInput> {
  bool hasError = false;
  String? errorText;

  /// Default country is Togo 🇹🇬
  Country selectedCountry = Country(
    phoneCode: '228',
    countryCode: 'TG',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Togo',
    example: '90 00 00 00',
    displayName: 'Togo',
    displayNameNoCountryCode: 'Togo',
    e164Key: '',
  );

  void _pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() => selectedCountry = country);
        widget.onChangeCountry(country);
      },
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.circular(16),
        inputDecoration: const InputDecoration(labelText: 'Search country', prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.fromTitle.isNotEmpty)
            CustomText(top: 5, bottom: 2, title: widget.fromTitle, textSize: AppSize.width(value: 16), fontWeight: FontWeight.w600),

          // Outer border container
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 100),
              border: Border.all(
                color: hasError ? Colors.red : ConstColor.cardBorderColour, // red if error
              ),
              color: widget.backgroundColor ?? Colors.transparent,
            ),
            child: Row(
              children: [
                // --- Prefix: country selector ---
                InkWell(
                  onTap: _pickCountry,
                  borderRadius: BorderRadius.circular(100),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        Text(selectedCountry.flagEmoji, style: const TextStyle(fontSize: 20)),
                        const SizedBox(width: 6),
                        Text("+${selectedCountry.phoneCode}", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                        const SizedBox(width: 6),
                        Text(selectedCountry.countryCode, style: TextStyle(color: ConstColor.textColor.withOpacity(0.7), fontSize: 13)),
                        const Icon(Icons.arrow_drop_down, size: 20),
                      ],
                    ),
                  ),
                ),

                // --- Input field ---
                Expanded(
                  child: TextFormField(
                    controller: widget.textController,
                    focusNode: widget.focusNode,
                    minLines: widget.minLines,
                    maxLines: widget.maxLine,
                    textInputAction: widget.textInputAction ?? TextInputAction.done,
                    keyboardType: widget.keyboardType ?? (widget.numeric ? TextInputType.number : TextInputType.text),
                    cursorColor: ConstColor.primaryColor,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: TextStyle(
                      color: ConstColor.textColor,
                      fontSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hint: widget.hintText,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      hintStyle: TextStyle(
                        color: ConstColor.cardBorderColour,
                        fontSize: AppSize.width(value: 12),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                      errorStyle: TextStyle(height: 0, fontSize: 0),
                    ),
                    validator: (value) {
                      final result = _getValidNumber(value, selectedCountry);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) {
                          setState(() {
                            hasError = result != null;
                            errorText = result;
                          });
                        }
                      });
                      return result;
                    },
                  ),
                ),
              ],
            ),
          ),

          if (hasError && errorText != null)
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4),
              child: Text(errorText!, style: const TextStyle(color: Colors.red, fontSize: 12)),
            ),
        ],
      ),
    );
  }
}

String? _getValidNumber(String? inputValue, Country country) {
  try {
    if (inputValue == null || inputValue.trim().isEmpty) {
      return ConstString.pleaseEnterPhone;
    }

    final cleanNumber = inputValue.replaceAll(RegExp(r'\s+'), '');
    final fullNumber = '+${country.phoneCode}$cleanNumber';

    final parsed = PhoneNumber.parse(fullNumber);
    final isValid = parsed.isValid(type: PhoneNumberType.mobile);

    if (!isValid) {
      return "Invalid phone number for ${country.name}";
    }
    if (cleanNumber.length < 6 || cleanNumber.length > 15) {
      return "Phone number length looks incorrect";
    }

    return null;
  } catch (e) {
    return "Invalid phone number format";
  }
}





// import 'package:flutter/material.dart';
// import 'package:go_connect/constant/const_color.dart';
// import 'package:go_connect/custom_widgets/text/custom_text.dart';
// import 'package:go_connect/utils/app_size.dart';

// class CustomFormFieldForNumberInput extends StatelessWidget {
//   final bool numeric;
//   final String fromTitle;
//   final Widget? hintText;
//   final int maxLine;
//   final int? minLines;
//   final TextEditingController? textController;
//   final String? Function(String?)? validator;
//   final Color? backgroundColor;
//   final Widget? prefixIcon;
//   final double? borderRadius;
//   final BoxConstraints? prefixIconConstraints;
//   final TextInputAction? textInputAction;
//   final FocusNode? focusNode;
//   final TextInputType? keyboardType;

//   const CustomFormFieldForNumberInput({
//     super.key,
//     this.fromTitle = "",
//     this.numeric = false,
//     this.hintText,
//     this.maxLine = 1,
//     this.minLines,
//     this.backgroundColor,
//     this.textController,
//     this.validator,
//     this.prefixIcon,
//     this.borderRadius,
//     this.prefixIconConstraints,
//     this.textInputAction,
//     this.focusNode,
//     this.keyboardType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           fromTitle == ''
//               ? SizedBox.shrink()
//               : CustomText(top: 5, bottom: 2, title: fromTitle, textSize: AppSize.width(value: 16), fontWeight: FontWeight.w600),
//           Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   style: TextStyle(
//                     color: ConstColor.textColor,
//                     fontSize: AppSize.width(value: 12),
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'Poppins',
//                     decorationThickness: 0,
//                   ),
//                   focusNode: focusNode,
//                   validator: validator,
//                   controller: textController,
//                   minLines: minLines,
//                   maxLines: maxLine,
//                   textInputAction: textInputAction ?? TextInputAction.done,
//                   keyboardType: keyboardType ?? (numeric ? TextInputType.number : null),
//                   cursorColor: ConstColor.primaryColor,
//                   decoration: InputDecoration(
//                     prefixIcon: prefixIcon,
//                     prefixIconConstraints: prefixIconConstraints,
//                     filled: backgroundColor != null,
//                     fillColor: backgroundColor,
//                     hoverColor: ConstColor.primaryColor,
//                     hintStyle: TextStyle(
//                       color: ConstColor.cardBorderColour,
//                       fontSize: AppSize.width(value: 12),
//                       fontWeight: FontWeight.w400,
//                       fontFamily: 'Poppins',
//                     ),
//                     // hintText: hintText,
//                     hint: hintText,
                    
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: ConstColor.cardBorderColour),
//                       borderRadius: BorderRadius.circular(borderRadius ?? 100),
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: ConstColor.cardBorderColour),
//                       borderRadius: BorderRadius.circular(borderRadius ?? 100),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black),
//                       borderRadius: BorderRadius.circular(borderRadius ?? 100),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(borderRadius ?? 100),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(borderRadius ?? 100),
//                     ),
//                     errorStyle: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
