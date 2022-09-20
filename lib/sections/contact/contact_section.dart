import 'dart:convert';

import 'package:cv_web/components/default_button.dart';
import 'package:cv_web/components/section_title.dart';
import 'package:cv_web/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'components/socal_card.dart';

var formKey = GlobalKey<FormState>();

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 2.5),
          SectionTitle(
            title: "Contact Me",
            subTitle: "For Project inquiry and information",
            color: Color(0xFF07E24A),
          ),
          ContactBox()
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1110),
      margin: EdgeInsets.only(top: kDefaultPadding * 2),
      padding: EdgeInsets.all(kDefaultPadding * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocalCard(
                color: Color(0xFFD9FFFC),
                iconSrc: "assets/images/linkedin.png",
                name: 'Linkedin',
                press: () {
                  _openLinkedin();
                },
              ),
              SocalCard(
                color: Color(0xFFE4FFC7),
                iconSrc: "assets/images/whatsapp.png",
                name: "What's App",
                press: () {
                  _openWhatsAppChat();
                },
              ),
              SocalCard(
                color: Color(0xFFE8F0F9),
                iconSrc: "assets/images/github.png",
                name: 'GitHub',
                press: () {
                  _openGitHub();
                },
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 2),
          ContactForm(),
        ],
      ),
    );
  }

  void _openWhatsAppChat() async {
    String phoneNumber = '+201027324902';
    await launch('https://wa.me/$phoneNumber');
    // launchUrl(Uri(path: ))
  }

  void _openGitHub() async {
    String gitHub = 'https://github.com/Omarzi';
    await launch('$gitHub');
    // launchUrl(Uri(path: ))
  }

  void _openLinkedin() async {
    String linkedin = 'https://www.linkedin.com/in/omar-abdel-aziz-643b801b3/';
    await launch('$linkedin');
    // launchUrl(Uri(path: ))
  }
}

class ContactForm extends StatelessWidget {
  ContactForm({
    Key? key,
  }) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController projectTypeController = TextEditingController();
  TextEditingController projectBudgetController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return 'Please Fill The Field';
                }
              },
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Your Name",
                hintText: "Enter Your Name",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return 'Please Fill The Field';
                }
              },
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Email Address",
                hintText: "Enter your email address",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              controller: projectTypeController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return 'Please Fill The Field';
                }
              },
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Project Type",
                hintText: "Select Project Type",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              controller: projectBudgetController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return 'Please Fill The Field';
                }
              },
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Project Budget",
                hintText: "Select Project Budget",
              ),
            ),
          ),
          SizedBox(
            // height: 300,
            // TextField by default cover the height, i tryed to fix this problem but i cant
            child: TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return 'Please Fill The Field';
                }
              },
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Write some description",
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png",
                text: "Contact Me!",
                press: () {
                  if (formKey.currentState!.validate()) {
                    sendEmail(
                      name: nameController.text,
                      email: emailController.text,
                      projectType: projectTypeController.text,
                      projectBudget: projectBudgetController.text,
                      description: descriptionController.text,
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future sendEmail({
    required String name,
    required String email,
    required String projectType,
    required String projectBudget,
    required String description,
  }) async {
    final serviceId = 'service_sl4ylo9';
    final templateId = 'template_oiu91ws';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'project_type': projectType,
          'project-budget': projectBudget,
          'description': description,
        }
      }),
    );

    print(response.body);
  }
}
