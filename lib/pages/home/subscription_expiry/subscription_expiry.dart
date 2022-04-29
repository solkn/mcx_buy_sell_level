import 'package:flutter/material.dart';
import '../../../services/api_service.dart';
import '../../../models/data/profile_data.dart';
import '../subscriptions/subscriptions_page.dart';

class SubscriptionExpiry extends StatefulWidget {
  @override
  _SubscriptionExpiryState createState() => _SubscriptionExpiryState();
}

class _SubscriptionExpiryState extends State<SubscriptionExpiry> {
  ProfileData profile;

  @override
  void initState() {
    super.initState();
    _initProfile();
  }

  @override
  Widget build(BuildContext context) {
    return profile == null || profile.daysLeft > 6
        ? SizedBox()
        : GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.center,
              color: Colors.red,
              width: double.infinity,
              child: Text(
                '${profile.daysLeft <= 0 ? 'Your subscription has expired' : 'Your subscripton will expire in ${profile.daysLeft} days'}. Tap here to renew your subscription.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            onTap: _onSubscribe,
          );
  }

  void _initProfile() async {
    try {
      profile = await apiService.getProfile();
      setState(() {});
    } catch (e) {}
  }

  void _onSubscribe() async {
    final refresh = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => SubscriptionsPage(),
      ),
    );
    if (refresh != null && refresh) {
      profile = null;
      setState(() {});
      _initProfile();
    }
  }
}
