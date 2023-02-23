import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/misc/user_types.dart';


/// This [Widget] is used to verify a user when logging into the 
/// website. Its intended to be used on mobile devices, desktops have a
/// different login page [LoginPageDesktop].
/// 
/// its also the initital page when entering the website.
class LoginPageMobile extends StatefulWidget {
  const LoginPageMobile({
    required this.updatePermissions,
  });

  /// Defines what type of permissions the user will have,
  final void Function(UserTypes) updatePermissions;

  @override
  State<LoginPageMobile> createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
  /// Vars to enable a text box for inputing password
  /// 
  /// [_passwordInput] the actual text in the password box
  /// [_passwordInputController] enables text editing
  String _passwordInput = '';
  final TextEditingController _passwordInputController = TextEditingController();

  @override
  void initState() {
    _passwordInputController.addListener(() {
      /// listens for text editing and changes the text in [_passwordInput] 
      /// to the text that is being typed
      _passwordInput = _passwordInputController.text;
    });

    super.initState();
  }

  @override
  void dispose() {
    _passwordInputController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// # Background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColorDark,
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorLight
              ]
            )
          ),
        ),
        /// # Box in the middle 
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              height: 750.h,
              width: 1400.w,
              color: Theme.of(context).primaryColorDark,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// ## password box 
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Theme.of(context).colorScheme.secondary,
                        height: 50,
                        width: 1400.w - 32,

                        child: Material(
                          child: TextField(
                            controller: _passwordInputController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10)
                            ),
                            style: TextStyle(
                              fontSize: 28.h,
                              color: Colors.black87
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  /// ## login buttons for each user permission
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      loginUserButton(
                        userType: UserTypes.Viewer,
                        route: '/matches',
                        context: context,
                      ),
                      loginUserButton(
                        userType: UserTypes.Scouter,
                        route: '/matches',
                        context: context,
                      ),
                      loginUserButton(
                        userType: UserTypes.Strategy,
                        route: '/matches',
                        context: context,
                      ),
                    ]
                  )
                ],
              )
            ),
          ),
        )
      ],
    );
  }

  /// actual user button, seperated from build only for convenience
  loginUserButton({
    required UserTypes userType,
    required String route,
    required BuildContext context,
  }) 
  {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            fixedSize: Size(200.w, 60.h),
            elevation: 20,
            shadowColor: Colors.black12
          ),
          onPressed: () {
            /// If user typed the correct password, we give the user
            /// the corresponding permission
            if(_passwordInput == PASSWORDS[userType.index]) {
              widget.updatePermissions(userType);
              context.go(Routing.MATCHES);
            }
          },
          
          child: Center(
            child: Text(userType.name.toUpperCase(),
              style: TextStyle(
                fontSize: max(14.w, 12),
                color: Colors.white
              ),
            ),
          )
        ),
      ),
    );

  }
}