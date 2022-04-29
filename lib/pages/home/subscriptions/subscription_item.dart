import 'package:flutter/material.dart';
import 'package:mcx_buy_sell_levels/pages/home/payment/payment.dart';

class SubscriptionItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final bool isPopular;
  final GestureTapCallback onTap;

  SubscriptionItem(this.image, this.title, this.price,
      {this.isPopular = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: GestureDetector(
        onTap:this.onTap,
        child: Card(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 180,
                      child: Image.asset('assets/images/$image.png'),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '$price',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.orange,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white),
                  ),
              
                ),
                
              ),
              if (isPopular)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        color: Colors.green,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Text(
                        'Popular',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
            ], // stack
          ),
        ),
      
      ),
    );
  }
}
