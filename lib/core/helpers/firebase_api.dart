import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FirebaseApi {
  final _fireMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    await _fireMessaging.requestPermission();
    final token = await _fireMessaging.getToken();
    print('Token: $token');
    initPushNotification();
  }

  void handleMessages(RemoteMessage? message) {
    if (message == null) return;
    Get.toNamed('/notification', arguments: message);
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessages);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }
}
