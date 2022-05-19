import 'package:boj/constants/app_text.dart';
import 'package:boj/screens/onboard/onboard_data.dart';
import 'package:boj/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);
  static String id = '/onBoardScreen';

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int curentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: curentPage == index ? Colors.lightBlueAccent : Colors.blueGrey,
        shape: BoxShape.circle,
      ),
    );
  }

  seenOnBoard() async {
    int seen = 0;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', seen);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                itemCount: boardContents.length,
                onPageChanged: (value) {
                  setState(() {
                    curentPage = value;
                  });
                },
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    SvgPicture.asset(
                      boardContents[index].image,
                      height: size.height * 0.38,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(boardContents[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      boardContents[index].paragraphs,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                curentPage == boardContents.length - 1
                    ? GetStarted(
                        btnName: startBtn,
                        onPressed: () async {
                          await seenOnBoard();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()));
                        },
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OnBoardNavBtn(
                            name: skip,
                            onPressed: () async {
                              await seenOnBoard();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WelcomeScreen()));
                            },
                          ),
                          Row(
                              children: List.generate(boardContents.length,
                                  (index) => dotIndicator(index))),
                          OnBoardNavBtn(
                            name: next,
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class GetStarted extends StatelessWidget {
  const GetStarted({
    Key? key,
    required this.btnName,
    required this.onPressed,
  }) : super(key: key);
  final String btnName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: SizedBox(
        height: size.height * 0.06,
        width: size.width * 0.8,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            btnName,
            style: const TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }
}

class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(6),
        splashColor: Colors.black12,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(name),
        ));
  }
}
