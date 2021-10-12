import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, desc, btn;
  final Widget icon;
  final Function onPressed;
  final bool isSuccess;

  CustomDialog({
    @required this.title,
    @required this.desc,
    @required this.btn,
    @required this.icon,
    @required this.onPressed,
    this.isSuccess = false,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      backgroundColor: Colors.transparent,
      child: dialogBox(context),
    );
  }

  dialogBox(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 15,
            left: 15,
            right: 15,
          ),
          margin: const EdgeInsets.only(
            top: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: isSuccess ? Colors.greenAccent[600] : Colors.red,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: onPressed,
                  child: Text(btn),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: CircleAvatar(
              backgroundColor: isSuccess ? Colors.greenAccent[600] : Colors.red,
              radius: 50,
              child: icon,
            ))
      ],
    );
  }
}