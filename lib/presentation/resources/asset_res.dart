const String svgPath = "assets/images/svg";
const String pngPath = "assets/images/png";
const String animPath = "assets/anim/";

const String svgPathSelected = "$svgPath/selected";
const String svgPathUnselected = "$svgPath/unselected";

const String pngPathSelected = "$pngPath/selected";
const String pngPathUnselected = "$pngPath/unselected";

class AppSvgAssetsSelected {
  static const String home = "$svgPathSelected/home.svg";
}

class AppSvgAssetsUnselected {
  static const String home = "$svgPathUnselected/uns-home.svg";
}

class AppSvgAssets {
  static const String flutterLogo = "$svgPath/flutter.svg";
}

class AppPngAssets {
  static const String idID = "$pngPath/indonesia.png";
  static const String enUS = "$pngPath/united-states.png";
  static const String photo = "$pngPath/photo.png";
  static const String trophy = "$pngPath/trophy.png";
  static const String flyerPetaniTambak = "$pngPath/flyer-petanitambak.png";
  static const String flyerMpDetection = "$pngPath/flyer-mpdetection.png";
  static const String flyerFlutter = "$pngPath/flyer-flutter.png";
  static const String flyerFigma = "$pngPath/flyer-figma.png";
  static const String flyerUnhas = "$pngPath/flyer-unhas.png";
}

class AppPngAssetsUnselected {
  static const String home = "$pngPathUnselected/uns-home.png";
  static const String education = "$pngPathUnselected/uns-education.png";
  static const String job = "$pngPathUnselected/uns-job.png";
  static const String skill = "$pngPathUnselected/uns-skill.png";
}

class AppPngAssetsSelected {
  static const String home = "$pngPathSelected/home.png";
  static const String education = "$pngPathSelected/education.png";
  static const String job = "$pngPathSelected/job.png";
  static const String skill = "$pngPathSelected/skill.png";
}

class AppAnimAssets {
  static const String error = "$animPath/error.json";
  static const String success = "$animPath/success.json";
  static const String loading = "$animPath/loading.json";
  static const String loadingEmail = "$animPath/loading-email.json";
  static const String empty = "$animPath/empty.json";
}
