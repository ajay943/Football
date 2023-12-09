// ignore_for_file: file_names, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Profile'),
      ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                    left: 5,
                    right: 5,
                  ),
                  child: Text(
                    'Complete Your Personal Details for Seamless Checkout Experience.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(0xff151515)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                  ),
                  height: 85,
                  width: 85,
                  decoration: const BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0.0, 5.0),
                    //     blurRadius: 5.0,
                    //   ),
                    // ],
                    image: DecorationImage(
                      image: AssetImage('assets/profileimage.png'),
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print('Clicked');
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (
                                  BuildContext context,
                                ) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )),
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Select Profile Pic",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: const Color(0xff000000)
                                                  .withOpacity(0.50),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Take Photo...",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        // const SizedBox(
                                        //   height: 15,
                                        // ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Select From gallery...",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Image.asset('assets/pencel.png'),
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50, bottom: 0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Full Name',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xff151515)),
                        children: <TextSpan>[
                          TextSpan(
                              text: '*',
                              style: GoogleFonts.notoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffF81111))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xff151515).withOpacity(0.20)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xff151515).withOpacity(0.30)),
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Amrita Satapathy',
                      labelStyle: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Color(0xff091D48),
                          fontWeight: FontWeight.w400),
                      hintStyle: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: const Color(0xff151515).withOpacity(0.80),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Contact No.',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xff151515)),
                        children: <TextSpan>[
                          TextSpan(
                              text: '*',
                              style: GoogleFonts.notoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffF81111))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xff151515).withOpacity(0.20)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xff151515).withOpacity(0.30)),
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: '+91 61204 92218',
                      labelStyle: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Color(0xff091D48),
                          fontWeight: FontWeight.w400),
                      hintStyle: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: const Color(0xff151515).withOpacity(0.80),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Email id',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xff151515)),
                        children: <TextSpan>[
                          TextSpan(
                              text: '*',
                              style: GoogleFonts.notoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffF81111))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xff151515).withOpacity(0.20)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xff151515).withOpacity(0.30)),
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'you@company.com',
                      labelStyle: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Color(0xff091D48),
                          fontWeight: FontWeight.w400),
                      hintStyle: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: const Color(0xff151515).withOpacity(0.80),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'DOB',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xff151515)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0, left: 20),
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                  controller: dateinput,
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xff151515).withOpacity(0.20)),
                    ),
                    contentPadding: EdgeInsets.only(left: 20),
                    suffixIcon: InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1947),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            print(formattedDate);

                            setState(() {
                              dateinput.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        child: const Icon(
                          Icons.calendar_month_sharp,
                          color: Color(0xffFF6600),
                        )),
                    labelStyle: GoogleFonts.notoSans(
                        fontSize: 14,
                        color: const Color(0xff000000).withOpacity(0.60),
                        fontWeight: FontWeight.w400),
                    hintStyle: GoogleFonts.notoSans(
                        fontSize: 16,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    print('Clicked');
                    Navigator.pushNamed(context, 'BottonNavBar');
                    // Navigator.pushNamed(context, 'BusinessDetailsPage');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 50),
                    height: 40,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Color(0xffFF6600),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Text(
                        'Save & Next',
                        style: GoogleFonts.notoSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class TextAling {}
