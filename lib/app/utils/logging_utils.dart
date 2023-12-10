import 'dart:developer';


//* For help development progress , not all log imply on prod
class LoggingUtils{

  static void logFunction(String functionName, bool isStart , {String message = "ON START FUNCTION"})
  {
    var current = DateTime.now();
    if(isStart){
      log("[Timestamp : ${current.hour}:${current.minute}:${current.second}] $message $functionName");
    }else{
      message = "ON END FUNCTION";
      log("[Timestamp : ${current.hour}:${current.minute}:${current.second}] $message  $functionName");
    }
  }

  static void logDebugValue (String data , String activity)
  {
    var current = DateTime.now();
    log("[Timestamp : ${current.hour}:${current.minute}:${current.second}] [Activity $activity] [DATA : ${data.toString()}]");
  }

  static void logError(String activity, String errMessage)
  {
    var current = DateTime.now();
    log("[Timestamp : ${current.hour}:${current.minute}:${current.second}] [Error Message on $activity : $errMessage ");
  }
}