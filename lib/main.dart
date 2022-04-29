import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/data/profile_data.dart';
import 'pages/auth/login/login_page.dart';
import 'pages/home/home_page.dart';
import 'state_managers/bloc/drawer_bloc.dart';
import 'services/local_storage_service.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(await localStorageService.getProfile()));
}

class MyApp extends StatelessWidget {
  final ProfileData profile;

  MyApp(this.profile);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBloc>(
          //builder: (context) => DrawerBloc(),

        create: (context)=>DrawerBloc(),
          
        dispose: (_, drawerBloc) => drawerBloc.dispose(),
        ),
   
      ],
      
      child: MaterialApp(
        title: 'MCX Buy Sell Levels',
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          primaryColor: Colors.blue[700],
          primarySwatch: Colors.blue,
        ),
        home: profile == null ? LoginPage() : HomePage(),
        //home: LoginPage(),
      ),
    );
  }
}
