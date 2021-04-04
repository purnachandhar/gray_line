import 'package:flutter/material.dart';
import 'package:grey_line_technologies_pvt_ltd/api/PdfInvoiceApi.dart';
import 'package:grey_line_technologies_pvt_ltd/api/pdf_api.dart';
import 'package:grey_line_technologies_pvt_ltd/model/details.dart';
import 'package:grey_line_technologies_pvt_ltd/model/student_details.dart';


class PdfScreen extends StatefulWidget {
  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          child: Text("Genarate Pdf"),
          onPressed: ()async{


            final studentdetails = StudentDetails(
              firstname:"Purna",
              lastname:"Chandhar",
              dateofbirth:"03/05/1996",
              gender:"male",
              fathersname:"shanker",
              mothersname:"divya",
              mobilenumber:"1234567890",
              emailid:"purn@gmail.com",
              aadhaarnumber:"1234567890123456",
              pancardnumber:"123456ssd",
              presentaddress:"qwerere",
              district:"erwer",
              pincode:"erwer",
              secondaryschooleducation:"ewrewrwe",
              yearofpass:"werewrew",
              percentagegpa:"werwerwe",
              boardofintermidiate:"ewrewrew",
              course:"werewrew",
              yearofpassboi:"werewrewr",
              percentageboi:"werewrewr",
              graduation:"werwerwer",
              course_specialization:"werewrew",
              yearofpassgraduation:"werwerewr",
              percentagegraduation:"werwerwerew",
              declaration:"rewrwerwerwer",

            );

            final pdfFile = await PdfInvoiceApi.generate(studentdetails);

            PdfApi.openFile(pdfFile);

          },
        ),
      ),
    );
  }
}
