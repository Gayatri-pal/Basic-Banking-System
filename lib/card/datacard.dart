import 'package:flutter/material.dart';

class PeopleAtm extends StatefulWidget {
  final String cardHolderName, cardNumber, cardExpiryDate;
  final double totalAmount;
  final gradientColor;

  PeopleAtm({
    Key key,
    this.cardHolderName,
    @required this.cardNumber,
    @required this.cardExpiryDate,
    @required this.totalAmount,
    @required this.gradientColor,
  });

  @override
  _PeopleAtmState createState() => _PeopleAtmState();
}

class _PeopleAtmState extends State<PeopleAtm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 340,
      decoration: BoxDecoration(
          gradient: widget.gradientColor,
          borderRadius: BorderRadius.all(
            Radius.circular(26),
          )),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 28,
            child: Text(
              "Card Number",
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.6,
                  ),
            ),
          ),
          Positioned(
            top: 50,
            left: 28,
            child: Text(
              widget.cardNumber,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                  ),
            ),
          ),
          Positioned(
            left: 30,
            bottom: 20,
            child: Text(
              "₹ ${widget.totalAmount}",
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                  ),
            ),
          ),
          Positioned(
            right: 28,
            bottom: 20,
            child: Text(
              widget.cardExpiryDate,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                  ),
            ),
          ),
          
        ],
      ),
    );
  }
}
