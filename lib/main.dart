import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:grey_line_technologies_pvt_ltd/api/PdfInvoiceApi.dart';
import 'package:grey_line_technologies_pvt_ltd/api/pdf_api.dart';
import 'package:grey_line_technologies_pvt_ltd/controller/form_controller.dart';
import 'package:grey_line_technologies_pvt_ltd/model/form.dart';
import 'package:grey_line_technologies_pvt_ltd/model/student_details.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


// ...

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: format,
      decoration: InputDecoration(
          labelText: "Date of Birth",
          labelStyle: TextStyle(fontSize: 20.0),
          icon: Icon(Icons.calendar_today_outlined),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          )
      ),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.

  final format = DateFormat("yyyy-MM-dd");

  String valuechoose;
  List listItem = [
    "Male", "Female","Other's"
  ];


  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController fathersnameController = TextEditingController();
  TextEditingController mothersnameController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController emailidController = TextEditingController();
  TextEditingController aadhaarnumberController = TextEditingController();
  TextEditingController pancardnumerController = TextEditingController();
  TextEditingController presentaddressController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController secondaryschooleducationController = TextEditingController();
  TextEditingController yearofpassController = TextEditingController();
  TextEditingController percentagegpaController = TextEditingController();
  TextEditingController boardofintermidiateController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController yearofpassboiController = TextEditingController();
  TextEditingController percentageboiController = TextEditingController();
  TextEditingController graduationController = TextEditingController();
  TextEditingController coursespecializationController = TextEditingController();
  TextEditingController yearofpassgraduationController = TextEditingController();
  TextEditingController percentagegraduationController = TextEditingController();
  TextEditingController declarationController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    print("button working");
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(

        firstnameController.text,
        lastnameController.text,
        dateofbirthController.text,
        valuechoose,
        fathersnameController.text,
        mothersnameController.text,
        mobilenumberController.text,
        emailidController.text,
        aadhaarnumberController.text,
        pancardnumerController.text,
        presentaddressController.text,
        districtController.text,
        pincodeController.text,
        secondaryschooleducationController.text,
        yearofpassController.text,
        percentagegpaController.text,
        boardofintermidiateController.text,
        courseController.text,
        yearofpassboiController.text,
        percentageboiController.text,
        graduationController.text,
        yearofpassgraduationController.text,
        coursespecializationController.text,
        percentagegraduationController.text,
        declarationController.text,


      );

      FormController formController = FormController();

      _showSnackbar("Submitting Feedback Please Wait...");



      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String response) async {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Feedback Submitted");

          final studentdetails = StudentDetails(

            firstname:firstnameController.text,
            lastname:lastnameController.text,
            dateofbirth: dateofbirthController.text,
            gender: valuechoose,
            fathersname:fathersnameController.text,
            mothersname: mothersnameController.text,
            mobilenumber:mobilenumberController.text,
            emailid: emailidController.text,
            aadhaarnumber:aadhaarnumberController.text,
            pancardnumber: pancardnumerController.text,
            presentaddress: presentaddressController.text,
            district: districtController.text,
            pincode:pincodeController.text,
            secondaryschooleducation: secondaryschooleducationController.text,
            yearofpass:  yearofpassController.text,
            percentagegpa: percentagegpaController.text,
            boardofintermidiate: boardofintermidiateController.text,
            course: courseController.text,
            yearofpassboi:yearofpassboiController.text,
            percentageboi:percentageboiController.text,
            graduation: graduationController.text,
            course_specialization:coursespecializationController.text,
            yearofpassgraduation:yearofpassgraduationController.text,
            percentagegraduation:percentagegraduationController.text,
            declaration:declarationController.text,

          );

          final pdfFile = await PdfInvoiceApi.generate(studentdetails);

          PdfApi.openFile(pdfFile);
          print("first name is  ${firstnameController.text}");
          firstnameController.clear();
          lastnameController.clear();
          dateofbirthController.clear();
          fathersnameController.clear();
          mothersnameController.clear();
          mobilenumberController.clear();
          emailidController.clear();
          aadhaarnumberController.clear();
          pancardnumerController.clear();
          presentaddressController.clear();
          districtController.clear();
          pincodeController.clear();
          secondaryschooleducationController.clear();
          yearofpassController.clear();
          percentagegpaController.clear();
          boardofintermidiateController.clear();
          courseController.clear();
          yearofpassboiController.clear();
          percentageboiController.clear();
          graduationController.clear();
          yearofpassgraduationController.clear();
          coursespecializationController.clear();
          percentagegraduationController.clear();
          declarationController.clear();
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
          print("Error Occurred");
        }
      });
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }


  DateTime date = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context)async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1940),
        lastDate: DateTime(2030)
    );
    if(picked != null && picked != date){
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //resizeToAvoidBottomPadding: true,
      appBar:new AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title:new Text("Gery Line Technologies Pvt Ltd"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Form(
                key: _formKey,
                child:
                Padding(padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: firstnameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter valid Name";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " First Name ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: lastnameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter valid Name";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Last Name",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DateTimeField(
                          format: format,
                          controller: dateofbirthController,
                          decoration: InputDecoration(
                              labelText: "Date of Birth",
                              labelStyle: TextStyle(fontSize: 20.0),
                              icon: Icon(Icons.calendar_today_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                          ),
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                        ),
                      ),

                      Padding(
                        padding:EdgeInsets.all(10.0),
                        child: DropdownButtonFormField(
                          // hint: Text("Gender"),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            value: valuechoose,
                            onChanged: (newValue) {
                              setState(() {
                                valuechoose = newValue;
                                print(valuechoose);
                              });
                            },
                            items: listItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),

                              );
                            }).toList(),

                            decoration: InputDecoration(
                                labelText: " Gender ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )

                        ),
                      ),

                      /* Padding(
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: (){
                            selectTimePicker(context);
                            print("working");
                            //dateofbirthController.text = "${date.day.toString()}/${date.month.toString()}/ ${date.year.toString()}";
                          },
                          child: TextFormField(
                            controller: dateofbirthController,
                          ),
                        ),
                      ),*/
                      /*Text(date.day.toString()),
                      Text(date.month.toString()),
                      Text(date.year.toString()),*/


                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            controller: fathersnameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter valid Name";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Father's Name ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: mothersnameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter valid Name";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Mother's Name",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.phone,
                            textCapitalization: TextCapitalization.words,
                            controller: mobilenumberController,
                            maxLength: 10,
                            validator: (value) {
                              if (value.length !=10) {
                                return "Enter valid Number";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Mobile Number ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.phone),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: emailidController,
                            validator: (value) {
                              if (!value.contains("@")) {
                                return "Enter valid Email";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Email Id ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.email_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.phone,
                            textCapitalization: TextCapitalization.words,
                            controller: aadhaarnumberController,
                            maxLength: 12,
                            validator: (value) {
                              if (value.length !=12) {
                                return "Enter valid Number";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Aadhaar Number ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.confirmation_number),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            controller: pancardnumerController,
                            maxLength: 10,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter valid Number";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Pan Card Number ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.confirmation_number),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            controller: presentaddressController,
                            maxLines: 2,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter valid Address";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Present Address ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.apartment_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            controller: districtController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter valid Address";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " District ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.words,
                            controller: pincodeController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter valid Address";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Pin Code ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            controller: secondaryschooleducationController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your School Name";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Secondary School Education ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.account_balance_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.words,
                            controller: yearofpassController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your pass of year";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Year Of Pass ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.words,
                            controller: percentagegpaController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your Percentage";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Percentage & GPA ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            controller: boardofintermidiateController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your College name";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Board Of Intermidiate ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.account_balance_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            controller: courseController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your Course";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Course ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.words,
                            controller: yearofpassboiController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your pass of year";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Year Of Pass ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.words,
                            controller: percentageboiController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your Percentage";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Percentage ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            controller: graduationController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your College Name";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Graduation ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.account_balance_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            controller: coursespecializationController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your Course";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Course & Specialization ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.words,
                            controller: yearofpassgraduationController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your Year Of Pass";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Year Of Pass ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.words,
                            controller: percentagegraduationController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Your Percentage";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Percentage ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                            maxLines: 3,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            controller: declarationController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Enter Something";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: " Declaration ",
                                labelStyle: TextStyle(fontSize: 20.0),
                                icon: Icon(Icons.wysiwyg_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                      ),


                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                        onPressed: _submitForm,

                        child: Text('Submit Feedback'),
                      ),

                      //PdfScreenWeiget()

                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget PdfScreenWeiget() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          child: Text("Genarate Pdf"),
          onPressed: ()async{
            final studentdetails = StudentDetails(


              /*
              * firstnameController.text,
        lastnameController.text,
        dateofbirthController.text,
        valuechoose,
        fathersnameController.text,
        mothersnameController.text,
        mobilenumberController.text,
        emailidController.text,
        aadhaarnumberController.text,
        pancardnumerController.text,
        presentaddressController.text,
        districtController.text,
        pincodeController.text,
        secondaryschooleducationController.text,
        yearofpassController.text,
        percentagegpaController.text,
        boardofintermidiateController.text,
        courseController.text,
        yearofpassboiController.text,
        percentageboiController.text,
        graduationController.text,
        yearofpassgraduationController.text,
        coursespecializationController.text,
        percentagegraduationController.text,
        declarationController.text,

*/


              firstname:firstnameController.text,
              lastname:lastnameController.text,
              dateofbirth: dateofbirthController.text,
              gender: valuechoose,
              fathersname:fathersnameController.text,
              mothersname: mothersnameController.text,
              mobilenumber:mobilenumberController.text,
              emailid: emailidController.text,
              aadhaarnumber:aadhaarnumberController.text,
              pancardnumber: pancardnumerController.text,
              presentaddress: presentaddressController.text,
              district: districtController.text,
              pincode:pincodeController.text,
              secondaryschooleducation: secondaryschooleducationController.text,
              yearofpass:  yearofpassController.text,
              percentagegpa: percentagegpaController.text,
              boardofintermidiate: boardofintermidiateController.text,
              course: courseController.text,
              yearofpassboi:yearofpassboiController.text,
              percentageboi:percentageboiController.text,
              graduation: graduationController.text,
              course_specialization:coursespecializationController.text,
              yearofpassgraduation:yearofpassgraduationController.text,
              percentagegraduation:percentagegraduationController.text,
              declaration:declarationController.text,

            );

            final pdfFile = await PdfInvoiceApi.generate(studentdetails);

            PdfApi.openFile(pdfFile);

          },
        ),
      ),
    );
  }
}

