import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/misc/user_types.dart';

/// This [Widget] is used to verify a 
/// user when logging into the website with a password,
/// 
/// its also the initital page when entering the website
class LoginPageDesktop extends StatefulWidget {  
  const LoginPageDesktop({
    required this.updatePermissions,
  });

  /// Defines what type of permissions the user will have,
  final void Function(UserTypes) updatePermissions;


  @override
  State<StatefulWidget> createState() => _LoginPageDesktopState();
  
}

class _LoginPageDesktopState extends State<LoginPageDesktop>{ 
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
      _passwordInputController.value = _passwordInputController.value.copyWith(
          text: _passwordInput,
          selection: TextSelection(
            baseOffset: _passwordInput.length,
            extentOffset: _passwordInput.length
            ),
          composing: TextRange.empty
          );
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
              // Aspect ratio of box is 16 / 9, 
              // to get width from height you need to do height / 9 * 16 
              height: 400.h,
              width: 888.w,
              color: Theme.of(context).primaryColorDark,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// ## password box 
                  SizedBox(
                    height: 200.h,
                    width: double.infinity,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Theme.of(context).colorScheme.secondary,
                          height: 70.h,
                          width: 700.w,

                          child: Material(
                            child: TextField(
                              controller: _passwordInputController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 30.h)
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
                  ),
                  /// ## login buttons for each user permission
                  SizedBox(
                    height: 200.h,
                    width: double.infinity,
                    child: Row(
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
                          userType: UserTypes.Admin,
                          route: '/matches',
                          context: context,
                        ),
                      ]
                    ),
                  )
                ],
              )
            ),
          ),
        )
      ]        
    );
  }
  
  /// actual user button, seperated from build only for convenience
  loginUserButton({
    required UserTypes userType,
    required String route,
    required BuildContext context,
  }) 
  {
    return ElevatedButton(
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
      
      child: Text(userType.name.toUpperCase(),
        style: TextStyle(
          fontSize: max(14.w, 12),
          color: Colors.white
        ),
      )
    );

  }
}
