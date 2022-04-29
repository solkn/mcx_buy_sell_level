import './local_storage_service.dart';
import '../models/data/profile_data.dart';
import '../models/data/notification_data.dart';
import '../others/constants.dart';
import '../utils/dio.dart';
import '../utils/firebase_messaging.dart';

class _ApiService {
  Future<String> login(String email, String password) async {
    final response = await dio.post('login', data: {
      'email': email,
      'password': password,
      'access_token': await firebaseMessaging.getToken(),
    });
    if (response.data['result'] == ResponseStatus.FAILED) {
      throw Exception(response.data['data']);
    }
    return 'empty_authorization';
  }

  Future<ProfileData> getProfile([String email]) async {
    if (email == null) {
      final profile = await localStorageService.getProfile();
      email = profile.email;
    }
    final response =
        await dio.get('get-profile', queryParameters: {'email': email});
    if (response.data['result'] == ResponseStatus.FAILED) {
      throw Exception(response.data['data']);
    }
    return ProfileData.fromDynamic(response.data['data'][0]);
  }

  Future<void> forgotPassword(String email) async {
    final response = await dio.post('forgot-password', data: {'email': email});
    if (response.data['result'] == ResponseStatus.FAILED) {
      throw Exception(response.data['data']);
    }
  }

  Future<String> signup(
      String name, String email, String password, String phoneNumber) async {
    final response = await dio.post('register', data: {
      'name': name,
      'email': email,
      'password': password,
      'mobile_no': phoneNumber,
      'access_token': await firebaseMessaging.getToken(),
    });
    if (response.data['result'] == ResponseStatus.FAILED) {
      throw Exception(response.data['data']);
    }
    return 'empty_authorization';
  }

  Future<List<NotificationData>> getNotifications() async {
    final profile = await localStorageService.getProfile();
    final response = await dio.get('notification', queryParameters: {
      'email': profile.email,
    });
    if (response.data['result'] == ResponseStatus.FAILED) {
      throw Exception(response.data['data']);
    }
    try {
      List<dynamic> list = response.data['data'];
      List<NotificationData> ndList = [];
      list.forEach((value) {
        ndList.add(NotificationData.fromDynamic(value));
      });
      return ndList;
    } catch (e) {
      return [];
    }
  }

  Future<void> increaseSubscription(String pkgId) async {
    final profile = await localStorageService.getProfile();
    final response = await dio.post('extend-subscription', data: {
      'email': profile.email,
      'package_id': pkgId,
    });
    if (response.data['result'] == ResponseStatus.FAILED) {
      throw Exception(response.data['data']);
    }
  }

  Future<String> requestInstamojoPaymentLink(String packageId) async {
    final profile = await localStorageService.getProfile();
    final response = await dio.post('create-payment-request', data: {
      'email': profile.email,
      'package_id': packageId,
    });
    if (response.data['result'] == ResponseStatus.FAILED) {
      throw Exception(response.data['data']);
    }
    return response.data['data'];
  }
}

Future<String> requestPaytmPaymentLink(String packageId) async {
  final profile =  await localStorageService.getProfile();

  final response = await dio.post('paytm-payment',data: {
    'email':profile.email,
    'package_id':packageId,

  });
    if (response.data['result'] == ResponseStatus.FAILED) {
      throw Exception(response.data['data']);
    }

    return response.data['data'];

}




final apiService = _ApiService();
