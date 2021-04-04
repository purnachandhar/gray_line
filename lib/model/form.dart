class FeedbackForm {
  String firstname;
  String lastname;
  String dateofbirth;
  String gender;
  String fathersname;
  String mothersname;
  String mobilenumber;
  String emailid;
  String aadhaarnumber;
  String pancardnumber;
  String presentaddress;
  String district;
  String pincode;
  String secondaryschooleducation;
  String yearofpass;
  String percentagegpa;
  String boardofintermidiate;
  String course;
  String yearofpassboi;
  String percentageboi;
  String graduation;
  String course_specialization;
  String yearofpassgraduation;
  String percentagegraduation;
  String declaration;

  FeedbackForm(
      this.firstname,
      this.lastname,
      this.dateofbirth,
      this.gender,
      this.fathersname,
      this.mothersname,
      this.mobilenumber,
      this.emailid,
      this.aadhaarnumber,
      this.pancardnumber,
      this.presentaddress,
      this.district,
      this.pincode,
      this.secondaryschooleducation,
      this.yearofpass,
      this.percentagegpa,
      this.boardofintermidiate,
      this.yearofpassboi,
      this.course,
      this.percentageboi,
      this.graduation,
      this.course_specialization,
      this.yearofpassgraduation,
      this.percentagegraduation,
      this.declaration);

  factory FeedbackForm.fromJson(dynamic json) {
  return FeedbackForm(
      "${json['firstname']}",
      "${json['lastname']}",
      "${json['dateofbirth']}",
      "${json['gender']}",
      "${json['fathersname']}",
      "${json['mothersname']}",
      "${json['mobilenumber']}",
      "${json['emailid']}",
      "${json['aadhaarnumber']}",
      "${json['pancardnumber']}",
      "${json['presentaddress']}",
      "${json['district']}",
      "${json['pincode']}",
      "${json['secondaryschooleducation']}",
      "${json['yearofpass']}",
      "${json['percentagegpa']}",
      "${json['boardofintermidiate']}",
      "${json['yearofpassboi']}",
      "${json['course']}",
      "${json['percentageboi']}",
      "${json['graduation']}",
      "${json['coursespecialization']}",
      "${json['yearofpassgraduation']}",
      "${json['percentagegraduation']}",
      "${json['declaration']}"
  );
  }

  Map toJson() => {
    'firstname': firstname,
    'lastname': lastname,
    'dateofbirth': dateofbirth,
    'gender': gender,
    'fathersname': fathersname,
    'mothersname': mothersname,
    'mobilenumber': mobilenumber,
    'emailid': emailid,
    'aadhaarnumber': aadhaarnumber,
    'pancardnumber': pancardnumber,
    'presentaddress': presentaddress,
    'district': district,
    'pincode': pincode,
    'secondaryschooleducation': secondaryschooleducation,
    'yearofpass': yearofpass,
    'percentagegpa': percentagegpa,
    'boardofintermidiate': boardofintermidiate,
    'course':course,
    'yearofpassboi': yearofpassboi,
    'percentageboi': percentageboi,
    'graduation': graduation,
    'course_specialization': course_specialization,
    'yearofpassgraduation': yearofpassgraduation,
    'percentagegraduation': percentagegraduation,
    'declaration': declaration,
  };
// Method to make GET parameters.

}
