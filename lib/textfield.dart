import 'package:flutter/material.dart';
import 'package:session/network.dart';

class TextFieldForum extends StatefulWidget {
  @override
  State<TextFieldForum> createState() => _TextFieldForumState();
}

class _TextFieldForumState extends State<TextFieldForum> {
  Session session = Session();
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                fillColor: Color(0xffDFD3C3),
                filled: true,
                icon: Icon(
                  Icons.person,
                  color: Color(0xffA68DAD),
                ),
                hintText: "Your Email",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 2, color: Color(0xffC7B198)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 1, color: Color(0xffC7B198)),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscured,
              focusNode: textFieldFocusNode,
              decoration: InputDecoration(
                fillColor: Color(0xffDFD3C3),
                filled: true,
                icon: const Icon(
                  Icons.lock,
                  color: Color(0xffA68DAD),
                ),
                hintText: "Your Password",
                // suffixIcon: Icon(
                //   Icons.visibility,
                //   color: Color(0xffA68DAD),
                // ),
                suffixIcon: GestureDetector(
                  onTap: _toggleObscured,
                  child: Icon(
                    _obscured
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 24,
                    color: Color(0xffA68DAD),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xffC7B198),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xffC7B198),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              onPressed: () {
                print('fetching');

                session.fetchData();
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffC7B198),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
