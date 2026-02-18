import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? color;
  final double height;
  final double fontSize;
  final double? width;
  final double top;
  final double right;
  final double left;
  final double bottom;
  final FontWeight fontWeight;
  final double horizontal;
  final bool isoutLined;
  final double buttonBorderRadius;
  final double vertical;
  final Color outLineColour;
  final double? borderWidth;
  final double? elevation;
  final Color? borderColor;

  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.color = ConstColor.primaryColor,
    this.height = 56,
    this.fontSize = 12,
    this.width,
    this.top = 12,
    this.right = 0,
    this.left = 0,
    this.bottom = 0,
    this.fontWeight = FontWeight.w400,
    this.horizontal = 20,
    this.isoutLined = false,
    this.buttonBorderRadius = 100,
    this.vertical = 0,
    this.outLineColour = ConstColor.primaryColor,
    this.borderWidth,
    this.elevation,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, right: right, left: left, bottom: bottom), //12
      child: ElevatedButton(
        onPressed: onPressed ?? () => print("Elevated Button Pressed"),
        style: (isoutLined)
            ? _outlinedButtonStyle(
          fontSize,
          fontWeight,
          width ?? double.infinity,
          height,
          buttonBorderRadius,
          vertical,
          horizontal,
          outLineColour,
          borderWidth,
          elevation,
          borderColor,
        )
            : _filledButtonStyle(
          color,
          fontSize,
          fontWeight,
          width ?? double.infinity,
          height,
          buttonBorderRadius,
          vertical,
          horizontal,
          elevation,
        ),
        child: child,
      ),
    );
  }
}

ButtonStyle _outlinedButtonStyle(
    double fontSize,
    FontWeight fontWeight,
    double width,
    double height,
    double buttonBorderRadius,
    double vertical,
    double horizontal,
    Color outLineColour,
    double? borderWidth,
    double? elevation,
    Color? borderColor,
    ) {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: outLineColour,
    textStyle: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textStyle: TextStyle()),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
      side: BorderSide(
        width: borderWidth ?? 1,
        color: borderColor ?? outLineColour,
      ),
    ),
    minimumSize: Size(width, height),
    elevation: elevation,
    padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
  );
}

ButtonStyle _filledButtonStyle(
    Color? color,
    double fontSize,
    FontWeight fontWeight,
    double width,
    double height,
    double buttonBorderRadius,
    double vertical,
    double horizontal,
    double? elevation,
    ) {
  return ElevatedButton.styleFrom(
    backgroundColor: color,
    foregroundColor: ConstColor.appDarktBackGround,
    textStyle: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textStyle: TextStyle()),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonBorderRadius)),
    minimumSize: Size(width, height),
    elevation: elevation,
    padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
  );
}



























// import 'package:flutter/material.dart';
// import 'package:go_connect/constant/const_color.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class CustomElevatedButton extends StatelessWidget {
//   final Widget child;
//   final void Function()? onPressed;
//   final Color? color;
//   final double height;
//   final double fontSize;
//   final double? width;
//   final double top;
//   final double right;
//   final double left;
//   final double bottom;
//   final FontWeight fontWeight;
//   final double horizontal;
//   final bool isoutLined;
//   final double buttonBorderRadius;
//   final double vertical;
//   final Color outLineColour;
//   final double? borderWidth;
//   final double? elevation;
//   final Color? borderColor;
//
//
//   const CustomElevatedButton({
//     super.key,
//     required this.child,
//     required this.onPressed,
//     this.color = ConstColor.primaryColor,
//     this.height = 56,
//     this.fontSize = 12,
//     this.width,
//     this.top = 12,
//     this.right = 0,
//     this.left = 0,
//     this.bottom = 0,
//     this.fontWeight = FontWeight.w400,
//     this.horizontal = 20,
//     this.isoutLined = false,
//     this.buttonBorderRadius = 100,
//     this.vertical = 0,
//     this.outLineColour = ConstColor.primaryColor,
//     this.borderWidth,
//     this.elevation,
//     this.borderColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: top, right: right, left: left, bottom: bottom), //12
//       child: ElevatedButton(
//         onPressed: onPressed ?? () => print("Elevated Button Pressed"),
//         style: (isoutLined)
//             ? _outlinedButtonStyle(
//                 fontSize,
//                 fontWeight,
//                 width ?? double.infinity,
//                 height,
//                 buttonBorderRadius,
//                 vertical,
//                 horizontal,
//                 outLineColour,
//                 borderWidth,
//                 elevation,
//
//
//               )
//             : _filledButtonStyle(color, fontSize, fontWeight, width ?? double.infinity, height, buttonBorderRadius, vertical, horizontal, elevation),
//         child: child,
//       ),
//     );
//   }
// }
//
// ButtonStyle _outlinedButtonStyle(
//   double fontSize,
//   FontWeight fontWeight,
//   double width,
//   double height,
//   double buttonBorderRadius,
//   double vertical,
//   double horizontal,
//   Color outLineColour,
//   double? borderWidth,
//   double? elevation,
//
// )
//
// {
//   return ElevatedButton.styleFrom(
//     // surfaceTintColor: Colors.transparent,
//     backgroundColor: Colors.transparent,
//     foregroundColor: outLineColour,
//     textStyle: GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight, textStyle: TextStyle()),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(buttonBorderRadius),
//       side: BorderSide(width: borderWidth ?? 1, color: outLineColour),
//     ),
//     minimumSize: Size(width, height),
//     elevation: elevation,
//     padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
//   );
// }
//
// ButtonStyle _filledButtonStyle(
//   Color? color,
//   double fontSize,
//   FontWeight fontWeight,
//   double width,
//   double height,
//   double buttonBorderRadius,
//   double vertical,
//   double horizontal,
//   double? elevation,
//
// ) {
//   return ElevatedButton.styleFrom(
//     backgroundColor: color,
//     foregroundColor: ConstColor.appDarktBackGround,
//     textStyle: GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight, textStyle: TextStyle()),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonBorderRadius)),
//     minimumSize: Size(width, height),
//     elevation: elevation,
//     padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
//   );
// }
