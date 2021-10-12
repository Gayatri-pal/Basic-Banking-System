import 'package:bankingapp/card/carddata.dart';
import 'package:bankingapp/card/constants.dart';
import 'package:bankingapp/card/datacard.dart';
import 'package:bankingapp/database/database_helper.dart';
import 'package:bankingapp/home/homeapp.dart';
import 'package:bankingapp/payment/payment.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  final double currentBalance;
  final int currentCustomerId;
  final String currentUserCardNumebr, senderName;
  
  ContactScreen({
    this.currentBalance,
    this.currentCustomerId,
    this.senderName,
    this.currentUserCardNumebr,
  });

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  DatabaseHelper _dbhelper = new DatabaseHelper();
  List<CardData> _list;
  int current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  void initState() {
    _list = CardData.cardDataList;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackColor,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(
          "People",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        elevation: 2,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => HomeApp()),
                        );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.blue.shade200,
              child: Text('GP'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 800,
              child: FutureBuilder(
                initialData: [],
                future: _dbhelper.getUserDetails(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Payment(
                              customerAvatar: snapshot.data[index].userName[0],
                              customerName: snapshot.data[index].userName,
                              senderName: widget.senderName,
                              customerAccountNumber:
                                  snapshot.data[index].cardNumber,
                              currentUserCardNumber:
                                  widget.currentUserCardNumebr,
                              currentCustomerId: widget.currentCustomerId,
                              currentUserBalance: widget.currentBalance,
                              transferTouserId: snapshot.data[index].id,
                              tranferTouserCurrentBalance:
                                  snapshot.data[index].totalAmount,
                            ),
                          ),
                        ),
                          child: PeopleAtm(
                          cardNumber: snapshot.data[index].cardNumber,
                          cardExpiryDate: snapshot.data[index].cardExpiry,
                          totalAmount: snapshot.data[index].totalAmount,
                          gradientColor: _list[index].myGradient,
                         
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
