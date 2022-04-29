import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcx_buy_sell_levels/pages/home/payment/payment.dart';

import '../../../models/data/notification_data.dart';

class ListItem extends StatelessWidget {
  final NotificationData notificationData;

  ListItem(this.notificationData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        _Divider(notificationData.signalTime),
        SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: _BuySellAboveLow(
                  true,
                  notificationData.buyPrice,
                  notificationData.buyTarget1,
                  notificationData.buyTarget2,
                  notificationData.buyTarget3,
                ),
                
              ),
              // Expanded(
              //   child: MaterialButton(
              //    onPressed: (){
              //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentScreen(amount: "1000")));

              //    },
              //     color:Colors.blue,
                  
              //   child: Text(
              //     "pay",
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              // ),
              
              //   ),
              // ),
              Expanded(
                child: _BuySellAboveLow(
                  false,
                  notificationData.sellPrice,
                  notificationData.sellTarget1,
                  notificationData.sellTarget2,
                  notificationData.sellTarget3,
                ),
              ),


             
              
              
            ],
          ),
        ),
        _StopLoss(notificationData.stopLoss),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  final String date;

  _Divider(this.date);

  String _getText() {
    final dateTime = DateTime.parse(date).toLocal();
    final today = DateTime.now();
    if (dateTime.day == today.day &&
        dateTime.month == today.month &&
        dateTime.year == today.year) {
      return 'Today - ${DateFormat('hh:mm a').format(dateTime)}';
    } else {
      return DateFormat('dd MMM, hh:mm a').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Divider(
          color: Colors.grey[400],
        ),
        Container(
          color: Colors.grey[50],
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            _getText(),
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class _BuySellAboveLow extends StatelessWidget {
  final bool isBuyAbove;
  final String price, target1, target2, target3;
  List<String> targets;

  _BuySellAboveLow(
      this.isBuyAbove, this.price, this.target1, this.target2, this.target3) {
    this.targets = [target1, target2, target3];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        bottom: 4,
        top: 4,
        left: 2,
        right: 2,
      ),
//      color: isBuyAbove ? Colors.green[50] : Colors.red[50],
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isBuyAbove ? Colors.green : Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  isBuyAbove ? 'Buy Above:' : 'Sell Below:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          for (int i = 1; i <= 3; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${isBuyAbove ? 'Buy' : 'Sell'} Target-$i: ',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    targets[i - 1],
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _StopLoss extends StatelessWidget {
  final String stoploss;

  _StopLoss(this.stoploss);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        left: 4,
        right: 4,
        bottom: 4,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
//          color: Colors.red.withOpacity(0.2),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Stoploss:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red[900],
              ),
              
            ),
            Text(
              this.stoploss,
              style: TextStyle(
                fontSize: 16,
                color: Colors.red[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
