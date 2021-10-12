import 'package:flutter/material.dart';

class UserATMCard extends StatefulWidget {
  @override
  _UserATMCardState createState() => _UserATMCardState();
}

class _UserATMCardState extends State<UserATMCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 199,
      width: 344,
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          )),
      child: Stack(
        children: [
          Positioned(
            left: 29,
            top: 30,
            child: Text(
              "Gayatri Pal",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                letterSpacing: .5,
                fontSize: 12,
              ),
            ),
          ),
          Positioned(
            left: 29,
            top: 49,
            child: Text(
              "**** **** **** 1245",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: .5,
                fontSize: 15,
              ),
            ),
          ),
          Positioned(
            right: 21,
            top: 35,
            child: Text(
              "gp",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 29,
            bottom: 50,
            child: Text("Total balance",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: .5,
                  fontSize: 20,
                )),
          ),
          Positioned(
            left: 29,
            bottom: 20,
            child: Text(
              "5000",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: .5,
              ),
            ),
          ),
          Positioned(
            right: 29,
            bottom: 20,
            child: Text(
              "500",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: .5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
