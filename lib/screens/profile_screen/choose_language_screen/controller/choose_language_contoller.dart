import 'package:get/get.dart';

class ChooseLanguageContoller extends GetxController {
  var selectedLanguage = Language.english.language.obs;

  void selectLanguage(String language) {
    selectedLanguage.value = language;
    update(); // Call update() to trigger a rebuild of GetBuilder widgets.
  }
}

enum Language {
  english('English'),
  french('French');

  final String language;
  const Language(this.language);
}
