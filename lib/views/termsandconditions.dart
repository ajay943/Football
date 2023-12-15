import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Conditions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Your banner widget here
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/slider1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'TERMS AND CONDITIONS',
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),

          SizedBox(height: 16.0),
          // Your terms and conditions content
          Text(
            'Third Unicorn Private Limited (hereinafter referred to as “Crickpe”, “we”, “our”, “us”) operates the website crickpe.com (“Crickpe Website”) and mobile application (“Crickpe App”) (hereinafter the Crickpe Website and Crickpe App are together referred to as “Crickpe Platform”). We through the Crickpe Platform offer online skill based fantasy cricket games (“Contests”) and an opportunity to offer cash rewards to real-life cricketers for good performance in a real-life cricket series or tournament (each a “Cricket Match”) (“Services”) to you, the user, (“User” or “you”) subject to compliance with these terms and conditions (hereinafter referred to as “Terms & Conditions”). By accessing and/or using the Crickpe Platform, you accept and agree to be legally bound by these Terms & Conditions, as it may be amended or supplemented from time to time, and agree to all operating rules, terms, conditions, policies, and procedures that may be published on Crickpe Platform or in connection with the Services. All such rules, terms, conditions, policies, and procedures are incorporated into these Terms & Conditions by reference.'
            'Services being provided on Crickpe Platform may be subject to additional rules and regulations set down in that respect (“Crickpe Platform Policies”). To the extent that these Terms & Conditions are inconsistent with Crickpe Platform Policies laid down, the Crickpe Platform Policies shall prevail.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '1. Modification of Terms & Conditions',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'We may change, add or remove portions of these Terms & Conditions at any time, and if we do so, we will post such changes on Crickpe Platform or post notifications in your account and the changes will become immediately effective, and your continued use of Crickpe Platform will indicate your acceptance of these Terms & Conditions as it is then in effect. Accordingly, you should visit Crickpe Platform from time to time to review the then-current and effective terms and conditions because they are legally binding on you.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '2.Eligibility',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 8.0),
          Text(
              '2.1 A User may use the Crickpe Platform if it is a natural person currently residing in India'
              '2.2 Any User who is “incompetent to contract” within the meaning of the Indian Contract Act, 1872 including minors, un-discharged insolvents etc. is not eligible to access the Crickpe Platform and use the Services.'
              '2.3 The Crickpe Platform should not be used, installed, or played by any person under the age of 18 (eighteen) years.'
              '2.4 Services on the Crickpe Platform are open only to Users currently residing in India. Users residing in the state of Assam, Odisha, Nagaland, Sikkim, Andhra Pradesh, and Telangana (“Restricted States”) are prohibited from participating in any Contests on the Crickpe Platform.'),
          SizedBox(height: 16.0),
          Text(
            '3.User Registration',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
              '3.1 If you wish to become a registered User of our Crickpe Platform, you will need to apply for a User account. The Users are permitted to open only one account. Crickpe reserves the right to close any duplicate accounts. All money held in duplicate account(s) will be forfeited. To apply for an account, you must complete all the details following the instructions on the Crickpe Platform. When registering on the Crickpe Platform, you are required to verify your mobile number for playing any of the Contests offered on our Platform. This is to safeguard against fraud of any form on the Crickpe Platform. All your information is kept confidential and processed as per our Privacy Policy'
              '3.2 Upon grant of the account by us, your account will be created, and you will be able to use the Crickpe Platform and play the Contest(s). We may refuse to grant an application for an account made by any person without giving a reason for such refusal. You continuously represent and warrant to us that only you are accessing your account and no one else. You are not authorised to enter Contests on the Crickpe Platform or otherwise until your account is registered and approved by us.'
              '3.3 When you register with us, you agree to receive promotional messages from us, and our affiliates, through SMS, Whatsapp, email, call and push notifications, in relation to Contests, offers, and discounts (of various types and nomenclature e.g. bonus/cashback). You may withdraw your consent to receive such notification by sending an email to contact@crickpe.com.'
              '3.4 Internet connectivity issues at your end, disruptions due to your local internet environment, errors in the setup of software or hardware on your end, or other factors not directly attributable to us, are beyond our control, and accordingly, we will not incur any liability for any halts, breaks, or interruptions in your usage of our Services on account of such issues.'
              '3.5 All monetary or non-monetary prizes, winnings are unique to each User and are non-transferable. In the event You attempt to transfer any winnings, discounts, or prizes, these will be forfeited at our sole discretion'),
          SizedBox(height: 16.0),
          Text(
            '4. Our Rights',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'We may, at our sole and absolute discretion: (i) restrict, suspend, or terminate your access to all or any part of Crickpe Platform or Services; (ii) change, suspend, or discontinue all or any part of the Services; (iii) reject, move, or remove any material that may be submitted by you; (iv) move or remove any Content that is available on Crickpe Platform; (v) deactivate or delete your account and all related information and files on the account; (vi) establish general practices and limits concerning use of Crickpe Platform; (vii) offer cashbacks to you in form we deem fit; (viii) revise or make additions and/or deletions to the roster of players available for selection in a Contest on account of revisions to the roster of players involved in the relevant Cricket Match; and (ix) assign our rights and liabilities hereunder to any entity.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '5. Intellectual Property',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            '5.1 Unless otherwise set out herein, content comprised within the Services, including text, graphics, user interfaces, visual interfaces, marks, illustrations, photographs, trademarks, logos, videos, audio, images, flash animations, applications, advertisements, programs, computer code and other information (collectively, the “Content”), including but not limited to the design, layout, “look and feel” and arrangement of such Content, is owned by Crickpe, its licensors or its content providers and is protected by copyright, trademark and other intellectual property and unfair competition laws.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '5.1 Unless otherwise set out herein, content comprised within the Services, including text, graphics, user interfaces, visual interfaces, marks, illustrations, photographs, trademarks, logos, videos, audio, images, flash animations, applications, advertisements, programs, computer code and other information (collectively, the “Content”), including but not limited to the design, layout, “look and feel” and arrangement of such Content, is owned by Crickpe, its licensors or its content providers and is protected by copyright, trademark and other intellectual property and unfair competition laws.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '5.2 IIn the event you wish to use any Content available on Crickpe, you may request Crickpe by writing to contact@crickpe.com. You will be solely responsible for all materials (whether publicly posted or privately transmitted) that you upload, post, e-mail, transmit, or otherwise make available on Crickpe Platform (“Users’ Content”). You represent and warrant that you own all intellectual property rights in the Users Content and that no part of the Users Content infringes any third party rights. You further confirm and undertake to not display or use of the names, logos, marks, labels, trademarks, copyrights or intellectual and proprietary rights of any third party on Crickpe. You agree to indemnify and hold harmless Crickpe, its directors, employees, affiliates and assigns against all costs, damages, loss and harm including towards litigation costs and counsel fees, in respect of any third party claims that may be initiated including for infringement of intellectual property rights arising out of such display or use of the names, logos, marks, labels, trademarks, copyrights or intellectual and proprietary rights on Crickpe, by you or through your commissions or omissions.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '5.3 You hereby grant to Crickpe and its affiliates, partners, licensors and associates a worldwide, irrevocable, royalty-free, non-exclusive, sub-licensable license to use, reproduce, create derivative works of, distribute, publicly perform, publicly display, transfer, transmit, and/or publish Users Content for any of the following purposes: (i) displaying Users Content on Crickpe; (ii) distributing Users Content, either electronically or via other media, and/or (iii) storing Users Content in a remote database accessible by end users, for a charge.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '5.4 This license shall apply to the distribution and the storage of Users Content in any form, medium, or technology',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '6. Crickpe Contests',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            '6.1 The Crickpe Platform offers fantasy cricket game. If you wish to participate in such Contest, contestants (“Contestants”) are invited to create their own fantasy teams (“Team/s”) to the maximum of 10 (ten) Teams consisting of real life cricketers participating in a Cricket Match to which the fantasy game relates. Crickpe offers its platform to Contestants for fantasy game Contest(s) being created relating to each Cricket Match, and Contestants can participate in such Contest(s) with their Teams. Depending upon the circumstances of each Cricket Match, the Contestants can edit their Teams till the official match start time as declared by the officials of the Cricket Match or adjusted deadline, as specified below.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '6.2 Crickpe reserves the right to abandon a specific round or adjust the deadline of a round in certain specific, uncertain scenarios, which are beyond Crickpes reasonable control',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '7. Types of Contests',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            '7.1 As part of our Services, we are offering 2 (two) types of Contests: (i) public Contests, where any User may become a Contestant and matching of contestants is done by the Crickpe Platform based on algorithm or its discretion; (ii) Private Contests, where you can invite your friends, batchmates and colleagues to participate in the Contests',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '7.2 A User can enter into a maximum of 10 Contests (including both public Contests and Private Contests) per Cricket Match. Any participation in a Contest more than 10 shall be automatically prohibited. All terms and conditions applicable to Contest(s) as set out herein shall be applicable to both types of the Contest(s). Users by participating in a Contest(s) hereby authorize Crickpe to appoint a third party/ Trustee/Escrow Agent to manage Users funds on Users behalf.'
            'Public Contest: In a Public Contest, Crickpe may offer Contests comprising of minimum 2 (two) Contestants and maximum 1 (one) crore Contestants or any other pre-determined number of Contestants. This type of a Contest may be a paid Contest. A paid Contest requires Users to pay a buy-in fee for participation.'
            'Private Contest: In a Private Contest, Crickpe enables Users to invite their friends, batchmates and colleagues (“Guests”) to create virtual private rooms for Contests. A Users may create a virtual private room consisting of a pre-determined number of Contestants (number of Contestants can range from 2 (two) Contestants to 10 (ten) Contestants). The User creating such a Contest will have to set a pre-determined joining amount for such Private Contest and thereby join that Private Contest and shall supply a name for the Private Contest and be provided with a unique identification code (“Private Contest Code”) (which will be issued to the account of such User)'
            'The User creating a virtual private room shall provide Crickpe with the contact details, email address, mobile number or social media ID of Guests to enable Crickpe to send a message or email inviting such Guest to register with Crickpe (if necessary) and participate in the Private Contest in relation to which the invite has been issued.'
            'It is clarified that the participation of a Guest in any Private Contest is subject to the pre- determined number of Contestants for that Private Contest, and Crickpe shall not be liable to any person for the inability of any Guest to participate in any Private Contest due to any cause whatsoever, including without limitation due to a hardware or technical malfunction or lack of eligibility of such Guest to participate in the Contest(s). Further, the participation of a Guest in any Private Contest shall be subject to these Terms & Conditions.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '7.3 You agree to abide by the rules and regulations of the Contests (Public and Private Contests) on the Crickpe Platform (“Match Rules”). You are required to ensure that you have read and understood the Match Rules before playing them. The Match Rules form part of the Crickpe Platform Policies and can be found on the Match rules/how to play page of our Platform.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '8. Casbhack Rewards',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            '8.1 Cashback, along with rewards such as referral bonus, KYC bonus, and joining bonus, earned prior to September 30th, 2023 will expire on November 30th, 2023.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '9. Payment Terms',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            '9.1 Once a User registers with Crickpe, we maintain a Crickpe account/wallet for the User to keep a record of all transactions with us. Payments connected with participation in Contests have to be made through a User’s Crickpe account/wallet. All deposit, winnings, discounts, cashbacks in relation to a User are credited in the Crickpe account/wallet. The underlying bank accounts are escrow accounts operated by a third party/ Trustee/ Escrow Agent appointed by Crickpe in accordance with Clause 7.2 of these Terms & Conditions. From these bank accounts, the payouts can be made to (i) Users (towards their withdrawals), (ii) real life cricketers basis the fantasy points earned by them on the Crickpe Platform on the basis of actual score in the Cricket Match or discretionary cash reward to cricketers by the Users, (iii) Crickpe (towards its platform fee including GST) and to (iv) Government (towards TDS on winnings amount and payment to real life cricketers). Crickpe receives only its share of the platform fees through the said third party/ Trustee/ Escrow Agent.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '10. KYC verification',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            '10.1 Crickpe may require Users to undergo an additional online document verification (“e-KYC”) in the following scenarios,'
            'where we suspect, or have been notified that the User has violated any of the Crickpe Platform Policies'
            'as may be required under applicable law; and'
            'as may be determined by Crickpe in its sole discretion'
            '10.2 As part of our e-KYC process, our automated system enables a mandatory process for Users to upload documents pertaining to their Permanent Account Number (PAN), AADHAR and bank account details.'
            '10.3 The e-KYC documents must be uploaded on Crickpe Platform, and we do not accept submissions in any other form or manner.'
            '10.4 At the time of uploading the document on Crickpe Platform, you must ensure the following'
            'documents are valid'
            'the document is clear and legible, and shared in a jpg, jpeg, or pdf format; and'
            'documents are not password protected'
            'User can readily access the OTPs for verification'
            '10.5 The validation of e-KYC documents may take up to 30 (thirty) days from the time of submission of the documents. We reserve the right to validate the e-KYC document at our sole discretion. You will be notified of the status of verification on your registered mobile number/email address and on Crickpe Platform.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '11. Restrictions on using the Crickpe Platform',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            '11.1 In accessing or using Crickpe Platform, you agree that you will abide by these Terms & Conditions and the Crickpe Platform Policies. In the event User does not abide by these Terms & Conditions and the Crickpe Platform Policies, Crickpe may, at its sole and absolute discretion, take necessary remedial action, including but not limited to'
            'restricting, suspending, or terminating any Users access to all or any part of the Services;'
            'deactivating or deleting a Users account and all related information and files on the account. Any amount remaining unused in the Users account on the date of deactivation or deletion shall be transferred to the Users bank account on record with Crickpe subject to a processing fee (if any) applicable on such transfers as set out herein'
            'refraining from awarding any prize(s) to such User',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '12. Representations and warranties',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            '12.1 The Users represent and warrant that:'
            'The User is eligible and competent to enter into transactions with other users and Crickpe.'
            'Any information that the User provides to us at any time during the access and use of the Services, whether at the stage of registration or any time thereafter is correct, complete, up- to-date, and accurate. We shall not be liable against any claim relating to the accuracy, completeness, and correctness of any information that a User provides to us. We may, at any time and at our sole discretion, require the User to verify the correctness, completeness, and accuracy of such information, and to that extent require the User to produce additional documentary proof. Where the User fails to provide us with valid documentary proof, we reserve the right to limit their access and use of the Services.'
            'The User will protect the information they provide to us. The User must never share their Crickpe account login information with anyone, including any other user of Crickpe Platform or any representative of Crickpe. You specifically understand and agree that we will not incur any liability for information provided by you to anyone which may result in your Crickpe account being exposed or misused by any other person'
            'The User has the required legal rights in relation to any content that they may transmit, upload, or otherwise make available on the Crickpe Platform, and such action of theirs shall not violate the intellectual property rights of a third party.'
            'The User shall use their Crickpe account solely for the purpose of playing the game offered through our Services.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            '13. Disclaimers',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // for bold text
              color: Colors.blue, // for blue color
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            '13.1 To the extent permitted under law, neither Crickpe nor its directors, officers, professional advisors, employees shall be responsible for the deletion, the failure to store, the mis-delivery, or the untimely delivery of any information or material.'
            '13.2 To the extent permitted under law, Crickpe shall not be responsible for any harm resulting from downloading or accessing any information or material, the quality of servers, games, products, Services, cancellation of competition and prizes. Crickpe disclaims any responsibility for, and if a User pays for access to one of the Services the User will not be entitled to a refund as a result of, any inaccessibility that is caused by Crickpe’s maintenance on the servers or the technology that underlies our sites, failures of Crickpe’s service providers (including telecommunications, hosting, and power providers), computer viruses, natural disasters or other destruction or damage of our facilities, acts of nature, war, civil disturbance, or any other cause beyond our reasonable control. In addition, Crickpe does not provide any warranty as to the content on the Crickpe Platform. Crickpe Platform content is distributed on an “as is, as available” basis.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 36.0),
          // Add more terms and conditions as needed
        ],
      ),
    );
  }
}
