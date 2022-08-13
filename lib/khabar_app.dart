import 'package:flutter/material.dart';
import 'package:khabar/Presentation/Screens/Home/home_screen.dart';
import 'package:khabar/Presentation/Theme/app_colors.dart';
import 'package:khabar/Presentation/Theme/screen_util.dart';
import 'package:khabar/Presentation/Theme/size_extension.dart';
import 'package:khabar/Presentation/Theme/theme_text.dart';

ThemeMode theme = ThemeMode.light;

class KhabarApp extends StatelessWidget {
  const KhabarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      themeMode: theme,
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: AppColors.lightBackground,
        primaryColor: AppColors.primary,
        textTheme: ThemeText.getLightTextTheme(),
        appBarTheme: AppBarTheme(
          color: AppColors.lightBackground,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: AppColors.bodyText,
          ),
          titleTextStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColors.primary,
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: AppColors.lightBackground,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(
            Colors.white,
          ),
          trackColor: MaterialStateProperty.all(
            AppColors.buttonText,
          ),
          overlayColor: MaterialStateProperty.all(
            const Color(0xFF667080).withOpacity(0.3),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(
            AppColors.buttonText,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(
            AppColors.buttonText,
          ),
          overlayColor: MaterialStateProperty.all(
            const Color(0xFF667080).withOpacity(0.3),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          elevation: 0.5,
          shape: CircleBorder(),
        ),
        splashColor: AppColors.primary.withOpacity(0.4),
        listTileTheme: ListTileThemeData(
          tileColor: Colors.white,
          minLeadingWidth: 120.w,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.white,
        ),
        chipTheme: ChipThemeData(
          selectedColor: AppColors.primary,
          backgroundColor: AppColors.lightBackground,
          labelStyle: const TextStyle(
            color: AppColors.primary,
          ),
          secondaryLabelStyle: const TextStyle(
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
              color: AppColors.primary,
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        splashColor: AppColors.primary.withOpacity(0.4),
        scaffoldBackgroundColor: AppColors.darkBackground,
        primaryColor: AppColors.primary,
        fontFamily: "Poppins",
        textTheme: ThemeText.getDarkTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColors.primary,
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: AppColors.lightBackground,
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(
            Colors.white,
          ),
          trackColor: MaterialStateProperty.all(
            AppColors.buttonText,
          ),
          overlayColor: MaterialStateProperty.all(
            const Color(0xFF667080).withOpacity(0.3),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(
            AppColors.buttonText,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(
            AppColors.buttonText,
          ),
          overlayColor: MaterialStateProperty.all(
            const Color(0xFF667080).withOpacity(0.3),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          elevation: 0.5,
          shape: CircleBorder(),
        ),
        listTileTheme: ListTileThemeData(
          tileColor: AppColors.darkBackground,
          textColor: AppColors.darkBody,
          minLeadingWidth: 120.w,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: AppColors.darkInput,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
