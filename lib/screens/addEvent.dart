import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventify/screens/home.dart';
import 'package:flutter/material.dart';

class Addevent extends StatefulWidget {
  const Addevent({super.key});

  @override
  State<Addevent> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Addevent> {
  String title='';
  String description='';
  String dateTimeStart='';
  String dateTimeEnd='';
  String location='';
  String organiser='';
  String socialMedia='';
  final _formKey = GlobalKey<FormState>();
  TimeOfDay startTime=TimeOfDay.now();
  var isLoading=false;
  final TextEditingController _dateController=TextEditingController();
  void SelectDate(){
    showDatePicker(
      context: context, 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2030),
      ).then((date){
        setState(() {
          _dateController.text=date.toString().split(" ")[0];
        });
      });
  }

  void submitEventForm(
    String title,
    String description,
    String dateTimeStart,
    String dateTimeEnd,
    String location,
    String organiser,
    String socialMedia,
  ) async {
      setState(() {
        isLoading = true;
      });
       try {
      //DocumentReference docRef = FirebaseFirestore.instance.collection('events').doc();
      final docRef = FirebaseFirestore.instance.collection('events').doc();
      await docRef.set({
        'title' : title,
        'description' : description,
        'dateTimeStart' : dateTimeStart,
        'dateTimeEnd' : dateTimeEnd,
        'location' : location,
        'organiser' : organiser,
        'socialMedia' : socialMedia,
        });
      

    } catch (error){
      print(error);
    }
    Navigator.of(context).pushReplacementNamed( Home.routeName);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 40, right: 10, left: 10,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 2, left: 5),
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Add Event',
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
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    border: const Border(
                      bottom: BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                      top: BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                      right: BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                      left: BorderSide(color: Color.fromRGBO(232, 34, 59, 1)),
                    ),
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 10),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Image',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: const Border(
                                top: BorderSide(width: 1, color: Colors.red),
                                bottom: BorderSide(width: 1, color: Colors.red),
                                left: BorderSide(width: 1, color: Colors.red),
                                right: BorderSide(width: 1, color: Colors.red))),
                        height: 250,
                        width: double.infinity,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate_rounded,
                              size: 80,
                              color: Color.fromRGBO(170, 170, 170, 1),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tap to add an Image',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(170, 170, 170, 1)),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                        child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onSaved: (value) => title = value!,
                            decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(232, 34, 59, 1)),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(232, 34, 59, 1)),
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Enter event title',
                          labelStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(0, 0, 0, 0.8)),
                        )),
                        const SizedBox(height: 20,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onSaved: (value) => description = value!,
                            decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(232, 34, 59, 1)),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(232, 34, 59, 1)),
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Enter event description',
                          labelStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(0, 0, 0, 0.8)),
                        )),
                        const SizedBox(height: 20,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Text('Date and Time of Start',style: TextStyle(fontSize: 20,color: Colors.black),)
                        ],),
                        const SizedBox(height: 10,),
                        TextFormField(
                          onSaved: (value) => dateTimeStart= value!,
                          controller: _dateController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: SelectDate, 
                              icon: const Icon(Icons.calendar_today)),
                            labelText: 'Choose Date',
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
                         const SizedBox(height: 20,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Text('Date and Time of End',style: TextStyle(fontSize: 20,color: Colors.black),)
                        ],),
                        const SizedBox(height: 10,),
                        TextFormField(
                          onSaved: (value) => dateTimeEnd = value!,
                          controller: _dateController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: SelectDate, 
                              icon: const Icon(Icons.calendar_today)),
                            labelText: 'Choose Date',
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
                        const SizedBox(height: 20,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onSaved: (value) => location = value!,
                            decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(232, 34, 59, 1)),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(232, 34, 59, 1)),
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Click Here to Choose Location',
                          labelStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(0, 0, 0, 0.8)),
                        )),
                        const SizedBox(height: 20,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Organiser',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onSaved: (value) => organiser= value!,
                            decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(232, 34, 59, 1)),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(232, 34, 59, 1)),
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Click Here to Type',
                          labelStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(0, 0, 0, 0.8)),
                        )),
                        const SizedBox(height: 20,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Social Media Link',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onSaved: (value) => socialMedia = value!,
                            decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(232, 34, 59, 1)),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(232, 34, 59, 1)),
                              borderRadius: BorderRadius.circular(12)),
                          labelText: 'Click Here to Insert a  Link',
                          labelStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(0, 0, 0, 0.8)),
                        )),
                        const SizedBox(height: 20,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                _formKey.currentState!.save();
                                submitEventForm(
                                          title,
                                          description,
                                          dateTimeStart,
                                          dateTimeEnd,
                                          location,
                                          organiser,
                                          socialMedia,
                                        );},
                              child: Text('Add')),
                              ElevatedButton(onPressed: null, child: Text('Cancel'))
                          ],
                        )
                        
                        
                     
                         
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
