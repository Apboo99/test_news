import 'package:flutter/material.dart';

Widget bigText({required String text, required Color color}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: 40, fontWeight: FontWeight.bold),
  );
}

Widget middleText({required String text, required Color color}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.normal),
  );
}

Widget smallText({required String text, required Color color}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.normal),
  );
}

Widget verySmallText({required String text, required Color color}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.normal),
  );
}

Widget customTextFormField(
  double width,
  double height, {
    // required TextEditingController controller,
  required TextInputAction textInputAction,
  required IconData iconData,
  required IconData eye,
  required String hintText,
  required TextInputType typeText,
  required String textForCheck,
  required void Function(String value)? func,
  // required String? Function(String? value)? validator,
}) {
  return Container(
    height: height*.06,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Colors.black, width: 1),
    ),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8,right: 0),
          child: Icon(
            iconData,
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SizedBox(
              height: height*.09,
              child: TextFormField(
                onChanged: (value) => func!(value),
                // validator: validator,
                // controller: controller,
                keyboardType: typeText,
                textInputAction: textInputAction,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  suffixIcon: typeText == TextInputType.visiblePassword
                      ? Icon(eye)
                      : const SizedBox(),
                  hintText: hintText,
                  border:   const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)) ,
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  errorStyle: const TextStyle(backgroundColor: Colors.transparent,
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red,width: 2,)
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
                style: const TextStyle(
                  fontSize: 15,
                ),
                obscureText: textForCheck == "password" ? true : false,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customSocialButton(double width, double height,
    {required String text, required String icon}) {
  return
    Container(
    margin: const EdgeInsets.only(top: 20),
    width: width * .4,
    height: height * .07,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Image.asset(icon, height: 40, width: 30),
        ),
        const SizedBox(
          width: 10,
        ),
        smallText(
          text: text,
          color: Colors.black,
        ),
      ],
    ),
  );
}

Container buildButtonFree(double width,
    {required String text,
    required Color colorOfText,
    required void Function()? onTaps}) {
  return Container(
    height: width * .12,
    decoration: const BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      // border: Border.all(
      //   color: text == "login"
      //       ? AppColors.primaryBackground
      //       : AppColors.primaryElement,
      //   width: 1,
      // ),
    ),
    child: GestureDetector(
      onTap: onTaps,
      child: Center(
        child: smallText(text: text, color: colorOfText),
      ),
    ),
  );
}
