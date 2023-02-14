

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension AppTextStyleExtension on Text {

  Text h4 ({TextStyle? style, TextAlign? align}){
    final defaultStyle = TextStyle(
        fontSize: 16,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontWeight: FontWeight.w500
    );

    return Text(
      data!,
      style: (this.style ?? defaultStyle).merge(style ?? defaultStyle),
      textAlign: align,
    );
  }

  Text h5 ({TextStyle? style, TextAlign? align}){
    final defaultStyle = TextStyle(
        fontSize: 14,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontWeight: FontWeight.w500
    );

    return Text(
      data!,
      style: (this.style ?? defaultStyle).merge(style ?? defaultStyle),
      textAlign: align,
    );
  }

  Text h6 ({TextStyle? style, TextAlign? align}){
    final defaultStyle = TextStyle(
        fontSize: 12,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontWeight: FontWeight.w400
    );

    return Text(
      data!,
      style: (this.style ?? defaultStyle).merge(style ?? defaultStyle),
      textAlign: align,
    );
  }

}