import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/profile/notification/widget/order-review/order_review_question.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class OrderReviewQuestions extends StatelessWidget {
  const OrderReviewQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: AppPaddings.screenPadding,
      child: Column(
        children: [
          OrderReviewQuestion(question: ProfileScreenTexts.question1,),
          OrderReviewQuestion(question: ProfileScreenTexts.question2,),
          OrderReviewQuestion(question: ProfileScreenTexts.question3,),
          OrderReviewQuestion(question: ProfileScreenTexts.question4,),
          OrderReviewQuestion(question: ProfileScreenTexts.question5,),
          OrderReviewQuestion(question: ProfileScreenTexts.question6,),
          OrderReviewQuestion(question: ProfileScreenTexts.question7,),
          TextField(
            maxLines: 10, // Allows multiple lines
            minLines: 5, // Minimum height
            decoration: Styles.getTextFieldInputDecoration(
              context: context,
              fillColor: AppColors.white,
              hintText: ProfileScreenTexts.additionalCustomerComment,
            ),
          ),
          16.kH,
          MessageContainer(message: ProfileScreenTexts.reviewCriticismMessage, backgroundColor: AppColors.primary30,)
        ],
      ),
    );
  }
}
