import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  final Widget child;
  final double headerHeight;

  AuthContainer({
    this.child,
    this.headerHeight = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _Background(
            this.headerHeight + 50,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  width: double.infinity,
                  height: this.headerHeight,
                  child: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Text(
                          'Wellcome to\nMCX Buy Sell Levels',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 16),
                        Expanded(
                          child: Hero(
                            tag: 'auth_logo',
                            child: Image.asset(
                              "assets/images/auth_logo.png",
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                    ),
                  ),
                  width: double.infinity,
                  child: this.child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final double height;

  _Background(this.height);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[800],
                height: height,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue[700],
                height: height,
              ),
            ),
          ],
        ),
        Container(
          color: Colors.grey[800],
          height: MediaQuery.of(context).size.height - this.height,
        ),
      ],
    );
  }
}
