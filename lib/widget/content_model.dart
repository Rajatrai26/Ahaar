class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: "Pick your food form our menu\n",
      image: "images/Vector.png",
      title: "Select from our\n     Best Menu"),
  UnboardingContent(
      description: "You can Pay Cash and online also ",
      image: "images/s2.png",
      title: "Easy and Online Payment"),
  UnboardingContent(
      description: "Good Service and\n    Healthy Foods",
      image: "images/screen3.png",
      title: "Fast Cooking")
];
