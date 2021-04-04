import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grey_line_technologies_pvt_ltd/api/pdf_api.dart';
import 'package:grey_line_technologies_pvt_ltd/model/details.dart';
import 'package:grey_line_technologies_pvt_ltd/model/student_details.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';
class PdfInvoiceApi{
  static Future<File> generate(StudentDetails studentDetails) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
        build: (context) => [
           builDetails(studentDetails)

        ]
    ));
    return PdfApi.saveDocument(name: "student_details.pdf",pdf: pdf);
  }
}

 pw.Widget builDetails(StudentDetails studentDetails) {
  return pw.Column(
    children: [
      pw.Text("Student Details",style: pw.TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
        children: [
          pw.Text("First Name:   " , style: pw.TextStyle(fontWeight: FontWeight.bold , fontSize: 25.0)),
          pw.Text(studentDetails.firstname, style: pw.TextStyle(fontWeight: FontWeight.normal ,fontSize: 22.0)),
        ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Last Name:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.lastname, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Date Of Birth:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.dateofbirth, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Gender:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.gender, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Father Name:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.fathersname, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Mother Name:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.mothersname, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Mobile Number:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.mobilenumber, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Email Id:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.emailid, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Aadhaar Number:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.aadhaarnumber, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Pancard Number:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.pancardnumber, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Present Address:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.presentaddress, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("District:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.district, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("PinCode:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.pincode, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Secondary School Education:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.secondaryschooleducation, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Year Of Pass:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.yearofpass, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Percentage Gpa:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.percentagegpa, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Board Of Intermidiate:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.boardofintermidiate, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Course:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.course, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Year Of Pass boi:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.yearofpassboi, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Percentage Inter:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.percentageboi, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Graduation:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.graduation, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Course Specialization:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.course_specialization, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Year Of Pass Graduation:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.yearofpassgraduation, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Percentage Graduation:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.percentagegraduation, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
      pw.SizedBox(height: 1 * PdfPageFormat.cm),
      pw.Row(
          children: [
            pw.Text("Declaration:   ", style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            pw.Text(studentDetails.declaration, style: pw.TextStyle(fontWeight: FontWeight.normal,fontSize: 22.0)),
          ]
      ),
    ]
  );
 }