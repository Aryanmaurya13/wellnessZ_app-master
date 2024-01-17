
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:wellnessz_app/data/shared_preferences/local_storage_functions.dart';
import 'package:wellnessz_app/data/shared_preferences/storage_keys.dart';


class FirebasePushNotification{
final _firebaseMessaging = FirebaseMessaging.instance;


Future<void> handleBackgroundMessage(RemoteMessage message)async{
  if (kDebugMode) {
    print(message.notification?.title);
  }
  if (kDebugMode) {
    print(message.notification?.body);
  }
  if (kDebugMode) {
    print(message.data);
  }
}

Future<void> initNotification()async{
  await _firebaseMessaging.requestPermission();
  final fCMToken = await _firebaseMessaging.getToken();
  await setDataToLocalStorage(dataType: StorageKey.stringType,prefKey: StorageKey.fcmToken,stringData: fCMToken);
  if (kDebugMode) {
    print("Token: $fCMToken");
  }
  //FirebaseMessaging.onBackgroundMessage((message) => handleBackgroundMessage(message));
  _firebaseMessaging.setForegroundNotificationPresentationOptions(alert: true,badge: true,sound: true);
  // _firebaseMessaging.onTokenRefresh.(
  //   onMessage: (Map<String, dynamic> message) async {
  //     Get.snackbar("message['notification']['title']","message['notification']['message']", snackPosition: SnackPosition.TOP,);
  //   },
  //   onLaunch: (Map<String, dynamic> message) async {
  //     print("onLaunch: $message");
  //   },
  //   onResume: (Map<String, dynamic> message) async {
  //     print("onResume: $message");
  //   },
  // );
}
}