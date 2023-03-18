import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numidaselfservice/helpers/utils.dart';

class LoanAgreement extends StatefulWidget {
  _LoanAgreementState createState() => _LoanAgreementState();
}

class _LoanAgreementState extends State<LoanAgreement> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: SafeArea(child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back, size: 40,)),
                      const SizedBox(width: 10,),
                    Expanded(
                      child: Text("NUMIDA SELF SERVICE TERMS AND CONDITIONS", 
                      style: titleText4,),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                // Text("Whereas", style:  subtitle,),
                const SizedBox(height: 20,),
                Text("Thank you for using Numida Self Service! Numida is a financial management mobile application software with associated financial and advertising services ('App'). Numida Self Service is provided by Numida Self Service Technologies Limited ( Numida Self Service Technologies), a company duly incorporated under the laws of Kenya and located at Plot 13 Valley Road, Nairobi, Kenya. The terms 'us', 'we' and 'our' as used in this Agreement refer to Numida Self Service.", style:  subtitle2,),
          
                const SizedBox(height: 10,),
                Text(" Acceptance of Terms and Conditions", style:  subtitle.copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text("You must read these Terms and Conditions carefully before creating a Numida Self Service account. By using Numida Self Service, and by clicking the “I agree to the Terms and Conditions and Data Privacy Policy” option upon creation of your account, you confirm that you have read, understood and agreed to comply with and be bound by these Terms and Conditions.", style:  subtitle2,),
                
                const SizedBox(height: 10,),
                Text("Privacy and information sharing", style:  subtitle.copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text("Your privacy is very important to Numida Technologies. We designed our Data Privacy Policy to clarify how we collect and can use the information that you input in the App. We encourage you to read our Data Privacy Policy, and to use it to help you make informed decisions. By using the App, you provide the right to  Numida Self Service to collect and use the information that you will enter in the App according to the Data Privacy Policy.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("We always appreciate your feedback, reviews, or other suggestions about the App as it helps us to improve our services to you, but you understand that we may use your feedback, reviews, or suggestions without any obligation to compensate you for them (just as you have no obligation to offer them).", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("Registration and account security", style:  subtitle.copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text("You affirm that the information that you submit during the creation of your account is accurate and up-to-date. You will also keep your contact information accurate and up-to-date thereafter.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("You will create a password for the App that allows you to view or edit data within the App.  You are responsible for keeping your password confidential. We ask that you do not share your password with others. Representatives of Numida Self Service will never ask you for your password.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("Honesty of reporting and full disclosure of transactions", style:  subtitle.copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text("You will report your financial transactions honestly and will capture all of your transactions into the App. This will result in the best and most complete information to help you manage your business. You will not use the App dishonestly to mislead  Numida Self Service about the true financial situation of you and/or your business. Using the App to record all of your transactions accurately and truthfully is in your best interest.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text(" Numida Self Service reserves the right to terminate its service to you if we determine that you have been using the App dishonestly or have not fully disclosed your financial transactions with the intention of misleading us to improve your chances of benefiting from our financial services.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("Costs to user", style:  subtitle.copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text("We currently provide the App for free, but please be aware that your network’s normal rates and fees, such as the fees for text messaging and data, will still apply. You are responsible for these expenses. We cannot guarantee that the App will continue to be free indefinitely.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("Changes to these Terms and Conditions", style:  subtitle.copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
          
                const SizedBox(height: 10,),
                Text("We will notify you in advance when we make changes to these Terms and Conditions and give you the opportunity to review the revised version before continuing to use our service. If you continue to use the App after receiving a notice of the change to our Terms and Conditions, you are accepting the changes.", style:  subtitle2,),
                 const SizedBox(height: 10,),
                Text("In the event that the Terms and Conditions for the App change, the latest version of the said Terms and Conditions shall always take precedence over the terms earlier on agreed upon.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("Disclaimer", style:  subtitle.copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text("We try to keep THE App functioning securely and reliably, and we sincerely hope that it will be valuable to you. But you use it at your own risk. We are providing THE App ON AN “as is” and “as available” BASIS, without any warranties, WHETHER EXPRESS OR IMPLIED. We do not guarantee that THE App will always be secure or error-free or that THE App will always function without disruptions, INTERRUPTIONS, delays or imperfections. NUMIDA TECHNOLOGIES WILL NOT BE RESPONSIBLE OR LIABLE FOR LOST PROFITS, REVENUES, OR DATA, FINANCIAL LOSSES OR INDIRECT DAMAGES, Though the main objectives of Numida Technologies are to help NUMIDA users to improve the management of their business and to increase their access to finance, we do not guarantee that THE App will improve the functioning or profitability of your business, and we do not guarantee that YOU WILL RECEIVE CREDIT FROM NUMIDA.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("We may, at our sole and absolute discretion, decline to act on any request for financial services made by you. if you apply for a loan on the app, We reserve the right to decline your application for a loan at any stage, at our sole and absolute discretion, without assigning any reason or giving you any notice. we reserve the right, at our sole and absolute discretion, to issue or decline to issue a loan and/or to vary the terms of any loan BASED on OUR assessment of the information that we have about you and your business.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("You explicitly agree that in no event shall  Numida Self Service, its directors, employees, contractors or affiliates be liable to you or any third party for any damages incurred by you, whether directly or indirectly. this includes, but is not limited to, lost profits, loss of data, loss of goodwill or business reputation, or other intangible loss, or any other loss or damage that may be incurred by you in connection with the use of or performance of THE app.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("We do our best to keep the App secure from all viruses, worms, or any computer or software-related risk that would ordinarily harm the effectiveness of your device, computer, mobile phone or any other electronic gadget on which App may be downloaded, and shall not be liable in the event that any of the above potential hazards is downloaded onto your device whether or not The App is in use.", style:  subtitle2,),
                const SizedBox(height: 10,),
                Text("BY ACCESSING OR USING The APP, YOU REPRESENT AND WARRANT THAT YOUR ACTIVITIES ARE LAWFUL IN EVERY JURISDICTION WHERE YOU ACCESS OR USE THE SERVICE.", style:  subtitle2,),
          
          
          
              ],
            ),
          ),
        )),
      ),
    );
  }
}
