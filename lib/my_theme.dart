import 'package:flutter/material.dart';

class MyTheme {

  static Color blackColor =  const Color(0xff383838);
  static   const Color primaryLight =   Color(0xff5D9CEC);
  static Color greenColor =  const Color(0xff39A552);
  static Color whiteColor =  const Color(0xffffffff);
  static Color primaryDark =  const Color(0xff060E1E);
  static Color blackPrimaryDark =  const Color(0xff141922);
  static Color redDark =  const Color(0xffC91C22);
  static Color politics =  const Color(0xff003E90);
  static Color health =  const Color(0xffED1E79);
  static Color business  =  const Color(0xffCF7E48);
  static Color science  =  const Color(0xffF2D352);
  static Color blackDark  =  const Color(0xff01050C);


  static Color lightGreen =  const Color(0xffDFECDB);
  static ThemeData lightMode = ThemeData(
      canvasColor: primaryLight,
      scaffoldBackgroundColor: MyTheme.lightGreen,
      appBarTheme:   AppBarTheme(
        centerTitle: true,
          titleTextStyle: TextStyle(color: MyTheme.blackColor),
          iconTheme: IconThemeData(
            color:MyTheme.whiteColor,
          ),
          color: MyTheme.greenColor,
         shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(30),
                 bottomRight: Radius.circular(30)
           )
         )
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),

        titleMedium:TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black),

      ));
  static ThemeData darkMode = ThemeData(
      canvasColor: primaryDark,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme:   AppBarTheme(
          centerTitle: true,

          iconTheme: IconThemeData(
            color:MyTheme.whiteColor,
          ),
          color: MyTheme.greenColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
              )
          )
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),
      ));

}
