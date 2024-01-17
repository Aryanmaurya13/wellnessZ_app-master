import 'package:shared_preferences/shared_preferences.dart';

setDataToLocalStorage({
  String? dataType,
  String? prefKey,
  bool? boolData,
  double? doubleData,
  int? integerData,
  String? stringData,
  List<String>? listOfStringData,
  String? jsonData,
}) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  switch (dataType) {
    case "BOOL":
      return sharedPreferences.setBool(prefKey!, boolData!);
    case "DOUBLE":
      return sharedPreferences.setDouble(prefKey!, doubleData!);
    case "INTEGER":
      return sharedPreferences.setInt(prefKey!, integerData!);
    case "STRING":
      return sharedPreferences.setString(prefKey!, stringData!);
    case "LIST-OF-STRING":
      return sharedPreferences.setStringList(prefKey!, listOfStringData!);
    case "JSON":
      return sharedPreferences.setString(prefKey!, jsonData!);
    default:
      return null;
  }
}

getDataFromLocalStorage({
  String? dataType,
  String? prefKey,
}) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  switch (dataType) {
    case "BOOL":
      return sharedPreferences.getBool(prefKey!);
    case "DOUBLE":
      return sharedPreferences.getDouble(prefKey!);
    case "INTEGER":
      return sharedPreferences.getInt(prefKey!);
    case "STRING":
      return sharedPreferences.getString(prefKey!);
    case "LIST-OF-STRING":
      return sharedPreferences.getStringList(prefKey!);
    case "JSON":
      return sharedPreferences.getString(prefKey!);
    default:
      return "fff";
  }
}

clearLocalStorage() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.clear();
}
