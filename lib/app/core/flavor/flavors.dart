enum Flavor {
  dev,
  prod,
}

Flavor appFlavor = Flavor.dev;

extension FlavoreExtension on Flavor? {
  bool get isDev => this == Flavor.dev;

  bool get isProd => this == Flavor.prod;

  String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Fake store Main';
      case Flavor.dev:
        return 'Fake store Dev';
    }
  }
}