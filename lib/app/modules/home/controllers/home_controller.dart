import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/data/enum_tab.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';

class HomeController extends GetxController {
  final navIndex = HomeTab.home.index.obs;
  final historyOfTab = RxList.of(growable: true, [HomeTab.home.index.obs]); 
  onSelectedNavIndex(value) => navIndex.value = value;

  final stackOfTab = List.of([]).obs;
  
  onTapNavigation(value){
    historyOfTab.add(value);
    onSelectedNavIndex(value);
    LoggingUtils.logDebugValue(historyOfTab.toString(), "activity");
  }


  onWillPopScopeTap()
  {
    navIndex.value = historyOfTab[historyOfTab.length - 2].value;
    historyOfTab.removeAt(historyOfTab.length - 1);
    LoggingUtils.logDebugValue(historyOfTab.toString(), "activity");
  }    


}



