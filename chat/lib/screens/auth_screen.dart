import 'package:chat/widgets/auth/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    AuthResult authRes;
    try {
      setState(() {
        _isLoading = true;
      });

      if (isLogin) {
        authRes = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        authRes = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await Firestore.instance
            .collection('users')
            .document(authRes.user.uid)
            .setData({
          'username': username,
          'email': email,
        });
      }
    } on PlatformException catch (err) {
      var msg = 'An error occured, please check your credentials.';

      if (err.message != null) {
        msg = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );

      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}
