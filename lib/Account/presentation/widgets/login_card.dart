import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';
import 'login_button.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Colors.white60, Colors.white10],
              ),
              border: Border.all(width: 2, color: Colors.white30)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'LOG IN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    hintText: 'User Name',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    return value!.trim().isNotEmpty
                        ? GetUtils.isEmail(value)
                            ? null
                            : 'Email is invalid'
                        : 'This field is required';
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: _passwordVisible
                        ? IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () => setState(() {
                              _passwordVisible = false;
                            }),
                          )
                        : IconButton(
                            onPressed: () => setState(() {
                                  _passwordVisible = true;
                                }),
                            icon: const Icon(Icons.visibility_off)),
                  ),
                  obscureText: _passwordVisible,
                  onChanged: (pass) {
                    _password = pass;
                  },
                  validator: (value) {
                    return value!.trim().isNotEmpty
                        ? null
                        : 'This field is required';
                  },
                ),
                LoginButton(
                  onPress: (){
                    
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
