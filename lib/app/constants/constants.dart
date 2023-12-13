
abstract class TextConstants{
  static const splashScreenWelcomeMessage = 'Welcome To JDL Community';
  static const username = "Username";
  static const password = "Password";

}


abstract class FileNameConstants{
  static const logoSplashScreen = "";
}


abstract  class SharedPreferencesKey{
  static const  isFirstInstall = "is_first_install";
  //* Get box
  static const savedPreferencesKey = "saved_preferences_key";
  static const localLanguage = "local_language";
  static const localTheme = "local_theme";
  static const themeBySystem = "theme_by_system";

}

abstract class PreferenceConstant{
  static const locally = "locally";
  static const accountBased = "accountBased";
} 

abstract class ImageAssetPaths{
  static const starterImages = "assets/images";
  static const splashLogoPath = "$starterImages/itbca.jpg";
  static const futsal = "$starterImages/futsal.jpg";
  static const secretSanta = "$starterImages/secret_santa.jpg";
  static const barbeque = "$starterImages/barbque.jpg";
  static const christmas1 = "$starterImages/christmas1.jpg";
  static const christmas2 = "$starterImages/christmas2.jpg";
  static const christmas3 = "$starterImages/christmas3.jpg";
  static const interngathering1 = "$starterImages/intern_gathering.jpg";
  static const interngathering2 = "$starterImages/intern_gathering_2.jpg";
  // static const indonesianFlag = "$starterImages/indonesian_flag.png";
  // static const englishFlag = "$starterImages/english_flag.png";
  static const indonesianFlag = "$starterImages/indonesian_flag_circle.jpg";
  static const englishFlag = "$starterImages/english_flag_circle.png";
  static const dummyUser = "$starterImages/dummy_user.jpg";
}


abstract class IconPaths{
  static const starterIcons = "assets/icons";
  static const events = "$starterIcons/events2.png";
  static const friends = "$starterIcons/friends.png";
  static const discussions = "$starterIcons/discussion.jpg";
  static const idea = "$starterIcons/idea.png";
  static const bills = "$starterIcons/bills.png";
  static const personalSpace = "$starterIcons/personal_space.png";
}
abstract class CommonConditions{
  static bool isEmptyValue(String value)
  {
    return value.isEmpty;
  }

  static bool isContainsSpace(String value)
  {
    return value.contains(" ");
  }

  
  static bool validateNotEmptyAndNotContainSpace(String value)
  {
    return isEmptyValue(value) && isContainsSpace(value);
  }
}

abstract class InternationalizationConstants{
  static const indonesianLocale = 'id';
  static const englishLocale = 'en';

  static const indonesian = "INDONESIAN";
  static const english = "ENGLISH";

}

abstract class NumberConstant{
  static const minimumLengthPw = 5;
  
}


abstract class LoggingConstant{
  static const successResponse = "SUCCESS RESPONSE";
  static const errorResponse = "ERROR RESPONSE";
  static const requestError = "REQUEST ERROR";

}