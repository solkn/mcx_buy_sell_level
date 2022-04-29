import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../others/enums.dart' show DrawerItem;

class DrawerBloc {
  DrawerBloc();

  factory DrawerBloc.of(BuildContext context) {
    return Provider.of<DrawerBloc>(context);

  }
 
  final _controller = StreamController<DrawerItem>.broadcast();

  Stream<DrawerItem> get onDrawerItemSelected {
    return _controller.stream;
  }

  selectDrawerItem(DrawerItem drawerItem) {
    _controller.add(drawerItem);
  }

  dispose() {
    _controller.close();
  }
}
