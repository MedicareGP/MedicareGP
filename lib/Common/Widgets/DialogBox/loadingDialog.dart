// استيراد حزمة تصميم المواد لعناصر واجهة المستخدم
import 'package:flutter/material.dart';
// استيراد ويدجت مخصص لعرض مؤشر تحميل دائري

// تعريف ويدجت بدون حالة 'LoadingAlertDialog'، وهو مكون واجهة مستخدم قابل لإعادة الاستخدام
class LoadingAlertDialog extends StatelessWidget {
  // متغير من نوع String قابل للتحويل إلى null لحفظ الرسالة التي ستعرض في الحوار
  final String? message;
  // باني الويدجت، يسمح بتوفير رسالة اختيارية
  const LoadingAlertDialog({super.key, this.message});

  // تجاوز طريقة البناء لوصف واجهة المستخدم للويدجت
  @override
  Widget build(BuildContext context) {
    // إرجاع ويدجت AlertDialog
    return AlertDialog(
      // خاصية 'key' غير ضرورية هنا ويمكن إزالتها لجعل الكود أنظف
      key: key,
      // محتوى AlertDialog، مهيكل في عمود للتخطيط العمودي
      content: Column(
        // تعيين mainAxisSize إلى min، بحيث يتقلص العمود ليناسب الأطفال
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // استدعاء دالة circularProgress من ويدجت التحميل المستورد
          // يُفترض أنها تعيد ويدجت، على الأرجح CircularProgressIndicator
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20.0),
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Color(0xff4f8caa),
              ),
            ),
          ),
          // SizedBox لإضافة بعض المسافة العمودية
          const SizedBox(
            height: 10,
          ),
          // ويدجت Text لعرض الرسالة
          // استخدام عامل '!' حيث أن الرسالة قابلة للتحويل إلى null
          // هذا يعني أنه من المتوقع أن تكون الرسالة غير فارغة عند الاستخدام
          Text(message!),
        ],
      ),
    );
  }
}
