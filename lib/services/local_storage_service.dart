import 'package:shared_preferences/shared_preferences.dart';

import '../models/data/profile_data.dart';

class _LocalStorageService {
  _LocalStorageService();

  Future<ProfileData> getProfile() async {
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey('profile')){
      return ProfileData.fromJson(sp.getString("profile"));
    }
    else{
      return null;
    }
  }

  Future<void> saveProfile(ProfileData profile) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('profile', profile.toJson());
  }

  Future<String> getAuthorization() async {
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey('authorization')){
            return sp.getString('authorization');

    }
    else{
      return null;
    }
  }

  Future<void> saveAuthorization(String authorization) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('authorization', authorization);
  }

  Future<bool> clear() async {
    final sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}

final localStorageService = _LocalStorageService();
