import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationOneSignal{

  void initOneSignal(){
    OneSignal.shared.init("4c5b5d9f-fbd9-4620-bed8-62ec6760ef13");
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.none);
  }
  //Ao logar
void load()async{
    OneSignal.shared.setExternalUserId("ISTERRA2");
  }
  //Ao deslogar
  void dispose(){
    OneSignal.shared.removeExternalUserId();
  }
}