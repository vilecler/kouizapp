import 'dart:ui';

String? selectedLocale;

const Map<String, String> acceptedLangs = {'fr': 'Français', 'en': 'English'};
const String defaultLang = 'en';

String loadTranslation(Map<String, dynamic> translations, [String? locale]){
  if(locale != null){
    if(translations.containsKey(locale)){
      return translations[locale]!;
    }
  }

  if(selectedLocale == null){
    if (acceptedLangs.containsKey(PlatformDispatcher.instance.locale.languageCode)){
      selectedLocale = PlatformDispatcher.instance.locale.languageCode;
    } else {
      selectedLocale = defaultLang;
    }
  }

  return translations[selectedLocale]!;
}

String getSelectedLocale(){
  return selectedLocale ?? defaultLang;
}

String getLocaleValue(String localeValue){
  if(acceptedLangs.containsKey(localeValue)){
    return acceptedLangs[localeValue]!;
  }
  return acceptedLangs[defaultLang]!;
}