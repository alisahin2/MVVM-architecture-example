import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double height;
  final VoidCallback onPressed;

  // ustteki parametrelerin constructor lari
  const SocialLoginButton(
      {Key key,
      @required
          this.buttonText, //buttontext in mutlaka olmasi gerektigini belirttim
      this.buttonColor,
      this.textColor,
      this.radius:
          16, // kullanici bu widgeti kullanirken bu dgerleri vermezse default olarak 16 alsin demektir
      this.height: 40,
      this.onPressed})
      : assert(buttonText != null),
        super(
            key:
                key); //burada butontext bos olamaz dedim.Sonra ust tarafa gidip @required diyerek belirtiyorum

  //bu widget cagirdiginda donusu asagidaki sekilde olcaktir
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
      onPressed: onPressed,
    );
  }
}
