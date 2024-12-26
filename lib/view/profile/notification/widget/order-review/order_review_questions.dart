import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/components/vertical_bordered_text_container.dart';
import 'package:sheba_plus/view/profile/notification/widget/order-review/order_review_question.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class OrderReviewQuestions extends StatelessWidget {
  const OrderReviewQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          VerticalBorderedContainer(
            child: Text(
              ProfileScreenTexts.review,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: AppPaddings.allPadding16,
            child: MessageContainer(
                backgroundColor: AppColors.white,
                borderColor: Colors.transparent,
                message: ProfileScreenTexts.reviewGreetingsMessage),
          ),
          Container(
            padding: AppPaddings.screenPadding,
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderReviewQuestion(
                  question: ProfileScreenTexts.question1,
                ),
                OrderReviewQuestion(
                  question: ProfileScreenTexts.question2,
                ),
                OrderReviewQuestion(
                  question: ProfileScreenTexts.question3,
                ),
                OrderReviewQuestion(
                  question: ProfileScreenTexts.question4,
                ),
                OrderReviewQuestion(
                  question: ProfileScreenTexts.question5,
                ),
                OrderReviewQuestion(
                  question: ProfileScreenTexts.question6,
                ),
                OrderReviewQuestion(
                  question: ProfileScreenTexts.question7,
                ),
                TextField(
                  maxLines: 10,
                  minLines: 5,
                  decoration: Styles.getTextFieldInputDecoration(
                    context: context,
                    fillColor: AppColors.white,
                    hintText: ProfileScreenTexts.additionalCustomerComment,
                  ),
                ),
                16.kH,
                MessageContainer(
                  message: ProfileScreenTexts.reviewCriticismMessage,
                  backgroundColor: AppColors.primary30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
