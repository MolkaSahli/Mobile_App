import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var isLogin = true;
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isLogin)
          Row(
            children: [
              const Icon(Icons.person_outline,
                  color: Color.fromRGBO(162, 14, 32, 1), size: 25),
              Container(
                margin: const EdgeInsets.only(top: 2, left: 5),
                child: const Text(
                  'Login Account',
                  style: TextStyle(
                    color: Color.fromRGBO(162, 14, 32, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          if (isLogin)
          const Text(
            'Hello, Welcome to our application!',
            style: TextStyle(
              color: Color.fromRGBO(93, 93, 93, 1),
              fontSize: 13,
            ),
          ),
          if (!isLogin)
          Row(
            children: [
               IconButton(
                onPressed:()=> setState(() {
                  isLogin=!isLogin;
                }),
                icon:const Icon(Icons.arrow_back_ios_new_rounded),
                color: const Color.fromRGBO(162, 14, 32, 1),),
               Expanded(
                 child: Container(
                  margin: const EdgeInsets.only(top: 2, left: 5),
                  child:const Text(
                    textAlign: TextAlign.center,
                    'New Account',
                    style: TextStyle(
                      color: Color.fromRGBO(162, 14, 32, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 ),
               ),
        ],
        ),
          const SizedBox(height: 50,),
          Column(
            children: [
              Form(
                child: Container(
                  padding: const EdgeInsets.only(left: 1, right: 10),
                  child: Column(
                    children: [
                      if (!isLogin)
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(232, 34, 59, 1)),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(232, 34, 59, 1)),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(232, 34, 59, 1)),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(232, 34, 59, 1)),
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(232, 34, 59, 1)),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(232, 34, 59, 1)),
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      if (!isLogin)
                      const SizedBox(height: 10,),
                      if (!isLogin)
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(232, 34, 59, 1)),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromRGBO(232, 34, 59, 1)),
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      if (!isLogin) 
                      const SizedBox(height: 10),
                      if (!isLogin)
                      TextFormField(
                        controller: _dateController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: showCalendar, 
                            icon: const Icon(Icons.calendar_today)),
                          labelText: 'Date of birth',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                            borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                      ),
                      if (isLogin)
                      const SizedBox(height: 7),
                      if (isLogin)
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: null, child: Text('Forgot Password ?'))
                        ],
                      ),
                      if(!isLogin)
                      const SizedBox(height: 40),
                      if (!isLogin)
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('By continuing, you agree to',
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                      ],),
                      if (!isLogin)
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Terms of Use',
                          style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
                          Text(' and',
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                          Text(' Privacy Policy',
                          style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
                      ],),
                      if (!isLogin)
                      const SizedBox(height: 10),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(162, 14, 32, 1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          fixedSize: const Size(339, 55),
                        ),
                        child: Text(isLogin? 'Login' : 'Sign Up'),
                      ),
                      const SizedBox(height: 30),
                      if (isLogin)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not register yet ?',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(99, 99, 99, 1),
                            ),
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 4)),
                              onPressed:()=> setState(() {
                                isLogin=!isLogin;
                              }),
                              child: const Text(
                                'Create Account',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      ),
    );
  }
}