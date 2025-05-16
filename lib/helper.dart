import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app/modules/auth/widgets/custom_togle_button.dart';
import 'app/modules/auth/widgets/login_conatiner.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool isDriver = true;
  bool rememberMe = false;
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [

          // Top 60% - Background Image with centered logo
          SizedBox(
            height: screenHeight * 0.65,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash/Splash Screen.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/icon-splash/spalsh_logo.svg',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    'Sign in to your Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Subtitle
                  Text(
                    'Enter your email and password to log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),

                  const SizedBox(height: 20),
                  CustomToggleButtons(
                    onToggle: (value) {
                      setState(() {
                        isDriver = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // Bottom 40% - White background
          Positioned(
            top: screenHeight * 0.7,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
            ),
          ),
          // Main content (to be added later)
          Positioned(
            left: 10,

            right: 10,
            bottom: 0,
            child: const LoginFormContainer(),
          ),
        ],
      ),
    );
  }
}