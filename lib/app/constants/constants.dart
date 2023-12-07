
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
}

abstract class CommonConditions{
  static bool emptyValue(String value)
  {
    return value.isEmpty;
  }

  static bool dirtyStringWithSpace(String value)
  {
    return value.isEmpty;
  }

  
  static bool validateNotEmptyAndNotContainSpace(String value)
  {
    return emptyValue(value) && dirtyStringWithSpace(value);
  }
}

