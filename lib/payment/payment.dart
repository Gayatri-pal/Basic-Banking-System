import 'package:bankingapp/card/constants.dart';
import 'package:bankingapp/database/database_helper.dart';
import 'package:bankingapp/home/homeapp.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  final String customerAvatar,
      senderName,
      customerName,
      customerAccountNumber,
      currentUserCardNumber;
  //final gradientColor;
  final int transferTouserId, currentCustomerId;
  final double currentUserBalance, tranferTouserCurrentBalance;
  Payment({
    this.customerAvatar,
    this.customerName,
    this.senderName,
    this.customerAccountNumber,
    this.currentUserCardNumber,
    this.currentCustomerId,
    this.transferTouserId,
    this.currentUserBalance,
    this.tranferTouserCurrentBalance, 
  });
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  double transferAmount;

  DatabaseHelper _dbHelper = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BackColor,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black87,
                  maxRadius: 70,
                  child: Text(
                    widget.customerAvatar,
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.customerName,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                  ),
                ),
                Text(widget.customerAccountNumber,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[600])),
              ],
            ),
          ),
          SizedBox(height: 100),
          Column(
            children: [
              Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value) {
                    transferAmount = double.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Please Enter a valid Amount",
                    prefixText: "₹ ",
                    hintStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              )),
            ],
          ),
          Spacer(),
          Container(
            height: 60.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                                title: "Successfull !",
                                desc: "Your Money has been transfared",
                              ));
                    },
                    child: Text(
                      "Transfar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      shadowColor: Colors.red,
                      elevation: 5,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
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

class CustomDialog extends StatelessWidget {
  final String title, desc, buttonText;
  final Image image;
  CustomDialog({this.title, this.desc, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 10,
          ),
          margin: EdgeInsets.only(
            top: 16,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                desc,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 24.0,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => HomeApp()));
                    },
                    child: Text("OK")),
              )
            ],
          ),
        ),
        Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              child: Column(children: <Widget>[
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                  size: 70,
                ),
              ]),
            ),
            )
      ],
    );
  }
}
