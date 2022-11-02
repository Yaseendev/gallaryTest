import 'package:flutter/material.dart';

enum ButtonState { idle, loading }

class LoginButton extends StatefulWidget {
  final VoidCallback onPress;
  const LoginButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  ButtonState buttonState = ButtonState.idle;
  bool isAnimating = true;

  @override
  Widget build(BuildContext context) {
    final isStretched = isAnimating || buttonState == ButtonState.idle;
    return Container(
      alignment: Alignment.center,
      //padding: EdgeInsets.all(30),
      child: AnimatedContainer(
        width: buttonState == ButtonState.idle
            ? MediaQuery.of(context).size.width
            : 82,
        duration: Duration(milliseconds: 250),
        onEnd: () => setState(() => isAnimating = !isAnimating),
        curve: Curves.easeIn,
        child: isStretched
            ? ElevatedButton(
                onPressed: () async {
                  setState(() {
                    buttonState = ButtonState.loading;
                  });
                  await Future.delayed(Duration(seconds: 3));
                  setState(() {
                    buttonState = ButtonState.idle;
                  });
                },
                child: FittedBox(child: Text('Submit')),
              )
            : Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(12),
                child: Center(
                    child: CircularProgressIndicator(color: Colors.white)),
              ),
      ),
    );
  }
}
