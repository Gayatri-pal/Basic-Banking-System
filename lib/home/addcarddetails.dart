import 'package:bankingapp/card/customdialog.dart';
import 'package:bankingapp/card/customtextfield.dart';
import 'package:bankingapp/database/database_helper.dart';
import 'package:bankingapp/home/contact.dart';
import 'package:bankingapp/model/userdata.dart';
import 'package:flutter/material.dart';

class AddCardDetails extends StatefulWidget {
  @override
  _AddCardDetailsState createState() => _AddCardDetailsState();
}

class _AddCardDetailsState extends State<AddCardDetails> {
  String cardHolderName;
  String cardNumber;
  String cardExpiry;
  double currentBalance;

  DatabaseHelper _dbhelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.black45,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          title: Text("Account Details"),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 2),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Cardholder Name",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomTextField(
                          hintName: "Enter Cardholder name",
                          onChanged: (value) => {cardHolderName = value},
                          keyboardTypeNumber: false,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Card Number",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomTextField(
                          hintName: "Enter Card number",
                          onChanged: (value) => {cardNumber = value},
                          keyboardTypeNumber: false,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Expiry Date",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomTextField(
                          hintName: "Enter Expiry Date",
                          onChanged: (value) => {cardExpiry = value},
                          keyboardTypeNumber: false,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Amount",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomTextField(
                          hintName: "Enter Amount",
                          onChanged: (value) =>
                              {currentBalance = double.parse(value)},
                          keyboardTypeNumber: true,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black87,
                              shadowColor: Colors.red,
                              elevation: 5,
                              shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            onPressed: () async {
                              if (cardHolderName != null &&
                                  cardNumber != null &&
                                  cardExpiry != null &&
                                  currentBalance != null) {
                                UserData _userData = UserData(
                                  userName: cardHolderName,
                                  cardNumber: cardNumber,
                                  cardExpiry: cardExpiry,
                                  totalAmount: currentBalance,
                                );

                                await _dbhelper.insertUserDetails(_userData);

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomDialog(
                                        onPressed: () {
                                          Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ContactScreen()))
                                              .then((value) => {});
                                        },
                                        title: "Done",
                                        isSuccess: true,
                                        desc:
                                            "Successfully added new Contact",
                                        btn: "Ok",
                                        icon: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      );
                                    });
                              } else {
                                print("First Input the Value");
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Creat",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
         
          ),
        ));
  }
}
