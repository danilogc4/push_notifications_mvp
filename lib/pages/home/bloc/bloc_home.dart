import 'package:onesignal_flutter/onesignal_flutter.dart';

class BlocHome{

  void initOneSignal(){
    OneSignal.shared.init("4c5b5d9f-fbd9-4620-bed8-62ec6760ef13");
    //OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.none);
  }
void load()async{
    OneSignal.shared.sendTag("user", "isterra");
  }

}