import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventify/screens/home.dart';
import 'package:eventify/widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class loginScreen extends StatefulWidget {
  static const routeName = '/login_screen';
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var isLogin = true;
  var isLoading=false;
  final auth =FirebaseAuth.instance;
  var datePicked=DateTime.now();
  final TextEditingController _dateController=TextEditingController();
  void showCalendar(){
    showDatePicker(
      context: context, 
      firstDate: DateTime(1950), 
      lastDate: DateTime.now(),
      ).then((date){
        setState(() {
          _dateController.text=date.toString().split(" ")[0];
        });
      });
  }


 void submitAuthForm(
    String email,
    String password,
    String userName,
    String number,
    String date,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential userCredential;
    try {
      setState(() {
        isLoading = true;
      });
      if (isLogin) {
        userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.of(context).pushNamed(Home.routeName);
      } else {
        userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.of(context).pushNamed(Home.routeName);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': userName,
          'email': email,
          'number': number,
          'date': date,
          'password':password
        });
      }
    } on PlatformException catch (err) {
      var message = 'An error occurred, Please check your credentials.';
      if (err.message != null) {
        message = err.message!;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthForm(submitFn: submitAuthForm, isLoading: isLoading)
    );
  }
}