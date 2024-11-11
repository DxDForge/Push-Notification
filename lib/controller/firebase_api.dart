import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notification/main.dart';

class FirebaseApi {
  //instance of firebaseMessaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  //method to initialize firebase messaging
  Future<void> initNotification() async {
    //request permission
    await _firebaseMessaging.requestPermission();

    //get user device token
    final fcmToken = await _firebaseMessaging.getToken();

    //print token
    print('Token: $fcmToken');
    initPushNoti();
  }

  void handleMessage(RemoteMessage? message) {
    //if Null(),
    if (message == null) return;
    //if message is not null, print the message
    navigatorKey.currentState?.pushNamed(
      "/notification",
      arguments: message,
    );
  }

  //mehtod for handle backgorund
  void initPushNoti() {
    //if app terminated
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    //listen to the background
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
