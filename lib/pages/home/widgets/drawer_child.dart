import 'package:flutter/material.dart';
import 'package:mcx_buy_sell_levels/pages/auth/login/login_page.dart';
import 'package:mcx_buy_sell_levels/pages/home/home_page.dart';
import 'package:mcx_buy_sell_levels/pages/home/my_account/my_account_container.dart';
import 'package:mcx_buy_sell_levels/pages/home/subscriptions/subscriptions_page.dart';
import 'package:mcx_buy_sell_levels/services/local_storage_service.dart';
import 'package:mcx_buy_sell_levels/utils/dialogs.dart';
import 'package:mcx_buy_sell_levels/utils/fade_route.dart';
import 'package:mcx_buy_sell_levels/utils/firebase_messaging.dart';
import 'package:provider/provider.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'selectable_list_title.dart';
import '../../../others/enums.dart';
import '../../../models/data/profile_data.dart';
import '../../../state_managers/bloc/drawer_bloc.dart';

class DrawerChild extends StatelessWidget {
  final DrawerItem selectedItem;

  DrawerChild({
    @required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerBloc>(
      builder: (context, drawerBloc, _) => Container(
        color: Colors.grey[800],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/images/investment.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  FutureBuilder<ProfileData>(
                    future: localStorageService.getProfile(),
                    builder: (context, snapshot) => Text(
                      'Hi, ${snapshot.hasData ? snapshot.data.name : ''}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            SelectableListTile(
              title: 'Symbols',
              icon: Icons.notifications_active,
              selected: selectedItem == DrawerItem.symbols,
              //onTap: () => drawerBloc.selectDrawerItem(DrawerItem.symbols),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),
         
            ),
            SelectableListTile(
              title: 'My Account',
              icon: Icons.account_circle,
              selected: selectedItem == DrawerItem.myAccount,
              //onTap: () => drawerBloc.selectDrawerItem(DrawerItem.myAccount),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAccountContainer())),
            ),
            SelectableListTile(
              title: 'Subscriptions',
              icon: Icons.payment,
              selected: selectedItem == DrawerItem.subscriptions,
              onTap: () =>
                  //drawerBloc.selectDrawerItem(DrawerItem.subscriptions),
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionsPage()))
            ),
            SelectableListTile(
              title: 'Share',
              icon: Icons.share,
              selected: false,
              //onTap: () => drawerBloc.selectDrawerItem(DrawerItem.share),
              onTap: ()=>
              WcFlutterShare.share(
              sharePopupTitle: 'Share MCX Buy Sell Levels',
              mimeType: 'text/plain',
              text:
                  'Download MCX Buy Sell Levels IOS or Android app now.\n\nhttp://hyperurl.co/mcx_buy_sell_levels')
              ,
            ),
            SelectableListTile(
              title: 'Logout',
              icon: Icons.lock,
              selected: false,
              //onTap: () => drawerBloc.selectDrawerItem(DrawerItem.logout),
              onTap: ()=>
              showConfirmationDialog(context, title: 'Logout!', message: 'Are you sure?',
              onYes: () async {
              await localStorageService.clear();
              //firebaseMessaging.deleteInstanceID();

              Navigator.pushAndRemoveUntil(
                         context, FadeRoute(page: LoginPage()), (_) => false);
                            
              },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
