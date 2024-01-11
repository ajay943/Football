import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Term & Conditions',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              // height: 164.0,
              height: MediaQuery.of(context).size.height * 0.19,
              child: Image.asset(
                'assets/t&c.png',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Funzy - Terms & Conditions',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Fancy Cricket Match") ("Services") to you, the user, ("User" or "you") subject to compliance with these terms and conditions (hereinafter referred to as "Terms & Conditions"). By accessing and/or using the Funzy Platform, you accept and agree to be legally bound by these Terms & Conditions, as it may be amended or supplemented from time to time, and agree to all operating rules, terms, conditions, policies, and procedures that may be published on Funzy Platform or in connection with the Services. All such rules, terms, conditions, policies, and procedures are incorporated into these Terms & Conditions by reference.',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '1.Funzy',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Funzy is the flagship brand of Sport Technologies Private Limited ("Funzy"). Through Funzy, along with its sub-pages, and the Funzy App, Funzy operates five separate portals through which it offers Funzy based, football based, basketball based, volleyball based, hockey based, baseball based, handball based, American football based and kabaddi based online fantasy games. Funzy as used herein shall be construed as a collective reference to Funzy and the Funzy App',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '2.Usage of Funzy',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Any person ("User") accessing Funzy or the Funzy App (Funzy platform) for participating in the various contests and games (including fantasy games), available on Funzy platform (Contest(s)) (Funzy Services) shall be bound by these Terms and Conditions, and all other rules, regulations and terms of use referred to herein or provided by Funzy in relation to any Funzy Services'
                    'Funzy shall be entitled to modify these Terms and Conditions, rules, regulations and terms of use referred to herein or provided by Funzy in relation to any Funzy Services, at any time, by posting the same on Funzy. Use of Funzy constitutes the Users acceptance of such Terms Conditions, rules, regulations and terms of use referred to herein or provided by Funzy in relation to any Funzy Services, as may be amended from time to time. Funzy may, at its sole discretion, also notify the User of any change or modification in these Terms  Conditions, rules, regulations and terms of use referred to herein or provided by Funzy, by way of sending an email to the Users registered email address or posting notifications in the User accounts. The User may then exercise the options provided in such an email or notification to indicate non-acceptance of the modified Terms and Conditions, rules, regulations and terms of use referred to herein or provided by Funzy. If such options are not exercised by the User within the time frame prescribed in the email or notification, the User will be deemed to have accepted the modified Terms  Conditions, rules, regulations and terms of use referred to herein or provided by Funzy',
                    style: TextStyle(fontSize: 10),
                  ),
                 SizedBox(height: 20.0),
                  Text(
                    '3.Intellectual Property',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                   Text(
                    'Funzy includes a combination of content created by Funzy, its partners, affiliates, licensors, associates and/or Users. The intellectual property rights ("Intellectual Property Rights") in all software underlying Funzy and the Funzy Platform and material published on Funzy, including (but not limited to) games, Contests, software, advertisements, written content, photographs, graphics, images, illustrations, marks, logos, audio or video clippings and Flash animation, is owned by Funzy, its partners, licensors and/or associates. Users may not modify, publish, transmit, participate in the transfer or sale of, reproduce, create derivative works of, distribute, publicly perform, publicly display, or in any way exploit any of the materials or content on Funzy either in whole or in part without express written license from Funzy',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '4.Third Party Sites, Services and Products',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                   Text(
                    'may contain links to other Internet sites owned and operated by third parties. Users use of each of those sites is subject to the conditions, if any, posted by the sites. Funzy does not exercise control over any Internet sites apart from Funzy and cannot be held responsible for any content residing in any third-party Internet site.Funzy inclusion of third-party content or links to third-party Internet sites is not an endorsement by Funzy of such third-party Internet site.'
                    'Users correspondence, transactions offers or related activities with third parties, including payment providers and verification service providers, are solely between the User and that third party. Users correspondence, transactions and usage of the services offers of such third party shall be subject to the terms and conditions, policies and other service terms adopted implemented by such third party, and the User shall be solely responsible for reviewing the same prior to transacting or availing of the services offers of such third party. User agrees that Funzy will not be responsible or liable for any loss or damage of any sort incurred as a result of any such transactions/offers with third parties. Any questions, complaints, or claims related to any third party product or service should be directed to the appropriate vendor',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Text(
                    '5.Privacy Policy',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                   Text(
                    'Any person ("User") accessing Funzy or the Funzy App (Funzy platform) for participating in the various contests and games (including fantasy games), available on Funzy platform (Contest(s)) (Funzy Services) shall be bound by these Terms and Conditions, and all other rules, regulations and terms of use referred to herein or provided by Funzy in relation to any Funzy Services.'
                    'Funzy shall be entitled to modify these Terms and Conditions, rules, regulations and terms of use referred to herein or provided by Funzy in vrelation to any Funzy Services, at any time, by posting the same on Funzy. Use of Funzy constitutes the Users acceptance of such Terms and Conditions, rules, regulations and terms of use referred to herein or provided by Funzy in relation to any Funzy Services, as may be amended from time to time. Funzy may, at its sole discretion, also notify the User of any change or modification in these Terms and Conditions, rules, regulations and terms of use referred to herein or provided by Funzy, by way of sending an email to the Users registered email address or posting notifications in the User accounts. The User may then exercise the options provided in such an email or notification to indicate non acceptance of the modified Terms  Conditions, rules, regulations and terms of use referred to herein or provided by Dream11. If such options are not exercised by the User within the time frame prescribed in the email or notification, the User will be deemed to have accepted the modified Terms Conditions, rules, regulations and terms of use referred to herein or provided by Funzy',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '6.User Conduct',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Funzy includes a combination of content created by Funzy, its partners, affiliates, licensors, associates and/or Users. The intellectual property rights ("Intellectual Property Rights") in all software underlying Funzy and the Funzy Platform and material published on Funzy, including (but not limited to) games, Contests, software, advertisements, written content, photographs, graphics, images, illustrations, marks, logos, audio or video clippings and Flash animation, is owned by Funzy, its partners, licensors and/or associates. Users may not modify, publish, transmit, participate in the transfer or sale of, reproduce, create derivative works of, distribute, publicly perform, publicly display, or in any way exploit any of the materials or content on Funzy either in whole or in part without express written license from Funzy',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
