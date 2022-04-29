import 'package:flutter/material.dart';
//import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:ui' as ui;

class NotificationUtils {
  static showNotification(
      BuildContext context, String title, String subtitle) async {
    final overlayState = Overlay.of(context);
    OverlayEntry entry;
    entry = OverlayEntry(builder: (context) {
      return Positioned(
        left: 0,
        right: 0,
        child: Material(
          textStyle: TextStyle(color: Colors.black),
          color: Colors.transparent,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Dismissible(
                key: Key('notification'),
                onDismissed: (_) {
                  entry.remove();
                  entry = null;
                },
                child: _Notification(title, subtitle),
              ),
            ),
          ),
        ),
      );
    });
    overlayState.insert(entry);
    AudioCache().play('audios/plucky.mp3');
    await Future.delayed(Duration(seconds: 8));

    if (entry != null) entry.remove();
  }
}

class _Notification extends StatelessWidget {
  final String title, subtitle;

  _Notification(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[300].withOpacity(0.8),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
