import 'package:shared_preferences/shared_preferences.dart';
import '../Models/Auth_model.dart';

import '../Models/Shared_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Sharedprefrence {

  // Convert DateTime to milliseconds since epoch
  int convertDateTimeToMillis(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  // Store data in SharedPreferences
  Future<void> storedata(AuthResponse response) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('accessToken', response.data.accessToken);

    // Convert expiresIn from milliseconds to DateTime and store as milliseconds
    DateTime expiry = DateTime.fromMillisecondsSinceEpoch(response.data.expiresIn);
    int expiryMillis = convertDateTimeToMillis(expiry);

    print("Storing expiry date as millis: $expiryMillis"); // Debug output

    await sp.setInt('expiryMillis', expiryMillis);
  }

  // Retrieve data from SharedPreferences
  Future<Sharedmodel> getdata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? accessToken = sp.getString('accessToken');
    int? expiryMillis = sp.getInt('expiryMillis');

    print("Retrieved expiry millis: $expiryMillis"); // Debug output

    // Convert milliseconds to DateTime
    DateTime? expiryDate;
    if (expiryMillis != null) {
      try {
        expiryDate = DateTime.fromMillisecondsSinceEpoch(expiryMillis);
      } catch (e) {
        print("Error parsing date: $e");
        expiryDate = null;
      }
    }

    return Sharedmodel(accessToken: accessToken, expiryDate: expiryDate);
  }

  // Clear all data from SharedPreferences
  Future<void> delete() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}