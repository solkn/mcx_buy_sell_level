import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/data/profile_data.dart';
import '../../../services/api_service.dart';
import '../../../widgets/connection_information.dart';

class MyAccountContainer extends StatefulWidget {
  @override
  _MyAccountContainerState createState() => _MyAccountContainerState();
}

class _MyAccountContainerState extends State<MyAccountContainer> {
  var getProfileFuture = apiService.getProfile();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProfileData>(
      future: getProfileFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return Container(
            color: Colors.grey[900],
            child: Column(
              children: [
                Expanded(child: _getProfileCard(context, snapshot.data)),
                _getFooter(),
              ],
            ),
          );
        } else {
          return Center(
            child: ConnectionInformation(
              showError: snapshot.connectionState == ConnectionState.done
                  ? snapshot.hasError
                  : false,
              onRetry: () {
                setState(() {
                  this.getProfileFuture = apiService.getProfile();
                });
              },
            ),
          );
        }
      },
    );
  }

  Widget _getProfileCard(BuildContext context, ProfileData profile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.loose,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 28),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 40),
                      Center(
                        child: Text(
                          '${profile.name}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 22),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Email: ${profile.email}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Mobile: ${profile.phoneNumber}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Days Left: ${profile.daysLeft <= 0 ? '0' : profile.daysLeft}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image.asset(
                  'assets/images/profile.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getFooter() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: _onOpenWebsite,
        child: Container(
          color: Colors.teal,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            'Visit Website',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  void _onOpenWebsite() async {
    const url = 'https://www.mcxsuregain.com';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  
}




