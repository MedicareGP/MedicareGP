// استيراد حزمة تصميم المواد لعناصر واجهة المستخدم
import 'package:flutter/material.dart';
import 'package:medicare/Common/config/config.dart';

// تعريف ويدجت بدون حالة 'ErrorAlertDialog' وهو مكون واجهة مستخدم قابل لإعادة الاستخدام
class ErrorAlertDialog extends StatelessWidget {
  // متغير من نوع String لحفظ الرسالة التي ستعرض في الحوار
  final String message;
  // باني الويدجت، يتطلب توفير رسالة عند استخدامه
  const ErrorAlertDialog({super.key, required this.message});

  // تجاوز طريقة البناء لوصف واجهة المستخدم للويدجت
  @override
  Widget build(BuildContext context) {
    // إرجاع ويدجت AlertDialog
    return AlertDialog(
      // محتوى AlertDialog، وهو ويدجت Text يعرض الرسالة الممررة
      content: Text(message),
      // قائمة الأفعال (الأزرار) التي توضع في أسفل AlertDialog
      actions: <Widget>[
        // حاوية لحمل الزر، مع تعيين عرضها ليكون بعرض الشاشة
        SizedBox(
          width: MediaQuery.of(context).size.width,
          // ويدجت ElevatedButton للتفاعل من قبل المستخدم
          child: ElevatedButton(
            // الدالة التي تنفذ عند الضغط على الزر؛ هنا تقوم بإغلاق الحوار
            onPressed: () {
              Navigator.pop(context);
            },
            // تنسيق الزر
            style: ButtonStyle(
              // شكل الزر، محدد كمستطيل مستدير

              // لون خلفية الزر
              backgroundColor: MaterialStateProperty.all(
                Medicare.textColor,
              ),
            ),
            // البطانة داخل الزر المحيطة بالنص
            child: Text(
              "OK",
              style: TextStyle(
                fontSize: 16, // حجم خط النص
                color: Medicare.whiteColor, // لون النص
              ),
            ),
          ),
        ),
      ],
    );
  }
}
