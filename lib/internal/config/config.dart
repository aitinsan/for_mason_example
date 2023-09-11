enum Flavor {
  development,
  production,
  staging,
}

class Config {
  static Flavor? flavor;

  static bool isProduction = flavor == Flavor.production;

  static bool get isDevelopment => flavor == Flavor.development;

  static bool get isStaging => flavor == Flavor.staging;

  static bool isDebug = isDevelopment ? true : false;

  // static bool get shouldLogCrashlytics => !isDebug; // TODO add this to logs

  static const String staging = "https://some-api.com";
  static const String production = "https://some-api.com";
  static const String test = "https://some-api.com";

  static const baseVersion = "v1";

  static String base = flavor == Flavor.production
      ? production
      : flavor == Flavor.development
          ? test
          : staging;

  static String apiUrl = "$base/api";
}
