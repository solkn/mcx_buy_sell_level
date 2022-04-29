import 'package:flutter/material.dart';

class SelectableListTile extends StatelessWidget {
  final String title;
  final bool selected;
  final IconData icon;
  final GestureTapCallback onTap;

  SelectableListTile({
    @required this.title,
    @required this.icon,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.white.withOpacity(selected ? 1 : 0.5);
    return Container(
      color: selected ? Colors.white.withOpacity(0.1) : Colors.transparent,
      child: Ink(
        child: ListTile(
          leading: Icon(
            this.icon,
            color: textColor,
          ),
          title: Text(
            this.title,
            style: TextStyle(
              color: textColor,
            ),
          ),
          onTap: this.onTap,
        ),
      ),
    );
  }
}
