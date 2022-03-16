# TD Logger

[![Pub][pub_v_image_url]][pub_url]

TD Logger is a simple logger for Flutter.

## Usage

```dart
  enum LogType { short, full }
```

```dart
  Logger.name = 'ThongDN'; // Set name of Logger (default: TDLogger)

  Logger.log('TD Logger -> Log', type: LogType.short);
  Logger.info('TD Logger -> Info', type: LogType.short);
  Logger.warning('TD Logger -> Warning', type: LogType.short);

  Logger.debug('TD Logger -> Debug');
  Logger.error('TD Logger -> Error');
```

Instead of a string message, you can also pass other objects (like List, Map or Set).

Note: **_This only print log in debug mode_**

## Output

```
flutter: ThongDN: TD Logger -> Log

flutter: ℹ️ ThongDN: TD Logger -> Info

flutter: ⚠️ ThongDN: TD Logger -> Warning


flutter: ┌------ ThongDN: 🐞 2022-03-16 17:00:37.324065 ------
flutter: │#0 _MyHomePageState._testLog
flutter: ├------------------------ Log ------------------------
flutter: │TD Logger -> Debug
flutter: └----------------------------------------------------

flutter: ┌------ ThongDN: ⛔  2022-03-03 17:43:39.434566 ------
flutter: │#0 _MyHomePageState._testLog
flutter: ├----------------------- Log ------------------------
flutter: │TD Logger -> Error
flutter: └----------------------------------------------------
```

## Author

TD Logger is developed by Thong Dang. You can contact me at thongdn.it@gmail.com

If you like my project, you can support me [![Buy Me A Coffee][buy_me_a_coffee_image_url]][buy_me_a_coffee_url] or star (like) for it.

Thank you! ❤️

[//]: # 'reference links'
[pub_url]: https://pub.dev/packages/td_logger
[pub_v_image_url]: https://img.shields.io/pub/v/td_logger.svg
[buy_me_a_coffee_image_url]: https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png
[buy_me_a_coffee_url]: https://www.buymeacoffee.com/thongdn.it
