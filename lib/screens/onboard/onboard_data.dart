import 'package:boj/constants/app_text.dart';

class OnBoarding {
  final String title;
  final String image;
  final String paragraphs;

  OnBoarding({
    required this.title,
    required this.image,
    required this.paragraphs,
  });
}

List<OnBoarding> boardContents = [
  OnBoarding(
    title: tittle1,
    paragraphs: paragraph1,
    image: image1,
  ),
  OnBoarding(
    title: tittle2,
    paragraphs: paragraph2,
    image: image2,
  ),
  OnBoarding(
    title: tittle3,
    paragraphs: paragraph3,
    image: image3,
  ),
  OnBoarding(
    title: tittle4,
    paragraphs: paragraph4,
    image: image4,
  ),
];
