import 'package:cv_web/components/default_button.dart';
import 'package:flutter/material.dart';

import '../../components/my_outline_button.dart';
import '../../constants.dart';
import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AboutTextWithSign(),
              Expanded(
                child: AboutSectionText(
                  text:
                      '''I am Flutter Developer, with one and a half years of experience in programming, and four years of experience in multiple programming languages and other fields.''',
                ),
              ),
              ExperienceCard(numOfExp: "04"),
              Expanded(
                child: AboutSectionText(
                    text:
                        'I know a lot of programming languages and I also know OOP for each language I know. The languages are C++, C#, Java, Python, and web design languages such as HTML, CSS, and I designed many websites using HTML, CSS and finally turned to the field of Mobile Development, especially Flutter Development, and I have done a lot of professional designs.'),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOutlineButton(
                imageSrc: "assets/images/hand.png",
                text: "Hire Me!",
                press: () {},
              ),
              SizedBox(width: kDefaultPadding * 1.5),
              DefaultButton(
                imageSrc: "assets/images/checkmark-16.png",
                text: "Check My CV",
                press: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
