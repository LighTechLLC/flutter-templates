# Flutter templates
Flutter basic templates project with Riverpod, Bloc and Triple state managers. Basic framework to implement internationalization, theme peeling functions, among others.

This template streamlines the project delivery with **static analysis** and **continuous integration** in one place.

- **Bloc** - [Template](bloc/) / [Documentation](https://bloclibrary.dev/#/)
- **Riverpod** - [Template](riverpod/) / [Documentation](https://riverpod.dev/)
- **Triple** - [Template](triple/) / [Documentation](https://triple.flutterando.com.br/)

## Features
- Theme support
- BLoC, Riverpod or Triple pattern
- Service Locator using [**get_it**](https://pub.dev/packages/get_it)
- Localization using [**intl**](https://pub.dev/packages/intl)
- CI Setup with GitHub Actions
- Codecov Setup with GitHub Actions
- Unit test coverage
- UI test example

## Static Analysis
- The template with  [**analyzer**](https://pub.dev/packages/analyzer)
- The template with [**Dart Code Metrics**](https://dartcodemetrics.dev/docs/getting-started/introduction)
- The template with [**Flutter Lints**](https://pub.dev/packages/flutter_lints)


## Android Screenshots
<p>
<img src="/doc/preview/android_empty_list.png" width="32%"/>
<img src="/doc/preview/android_filled_list.png" width="32%"/>
</p>

## iOS Screenshots
<p>
<img src="/doc/preview/ios_empty_list.png" width="32%"/>
<img src="/doc/preview/ios_filled_list.png" width="32%"/>
</p>

## FAQ

#### 1. Package Name change
```bash
flutter pub run change_app_package_name:main com.new_package_name
```
where com.new_package_name is the new Package Name

#### 2. Change name in pubspec.yaml
Documentation - https://dart.dev/tools/pub/pubspec#name

Steps to follow on Mac OS / Linux:
```bash
sed -i "" "s/template_bloc/new_name/g" pubspec.yaml
find . -name '*.dart' -print0 | xargs -0 sed -i "" "s/template_bloc/new_name/g"
```

Where new_name is the new name, template_bloc is the old name.

These commands will change the name in pubspec.yaml and renew import!

#### 3. NoAnimationRoute use case.
Allows to switch to the specified screens without animation. It is necessary to have two routers for one screen: a regular one and one with a “non_animated” postfix, as well as to add case to getGeneratedRoutes() method.

Use case:

```dart
case Routes.exampleNonAnimated:
	return NoAnimationRoute<dynamic>(
		settings: settings,
		builder: (context) => _routes[Routes.example](context),
	);
	break;
```

#### 4. Change standard icon
To change an icon - [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) and use the config:

```yaml
flutter_icons:
  android: "launcher_icon"
  ios: true
  remove_alpha_ios: true
  image_path_ios: "res/icon/icon.png"
  image_path_android: "res/icon/icon_android.png"
  adaptive_icon_background: "#000000"
  adaptive_icon_foreground: "res/icon/icon_android.png"
```

To renew the icon run the command:

```bash
flutter pub run flutter_launcher_icons:main
```

#### 5. Add flutter web support
```bash
flutter create --platforms web --org com.new_package_name --project-name new_name .
```
Where com.new_package_name is the new Package Name from the paragraph [Change Package Name](#1-package-name-change)

Where new_name is the new name in pubspec.yaml from the paragraph [Change name in pubspec.yaml](#2-change-name-in-pubspecyaml)


When the command has been executed, remember to delete the test/widget_test.dart file.

## Contributing 🤝

Feel free to open an issue or submit a pull request for any bugs/improvements.

## License 📄

The template is distributed under the MIT License - see the [License](LICENSE) file for details.
Please note that the generated template prompts to start with the MIT license, but you can change it to whichever you prefer, as long as you attribute the use of the template to the MIT terms. 
