
enum Affordability{
  Affordable,
  Pricey,
  Luxurious
}

enum Complexity1{
  Simple,
  Hard,
  Challenging

}
class Meal {

  final id,title,imageUrl;
  final  List<String>categories,ingredients,steps;

  final bool isGlutenFree ,isVegan,isVegetarian,isLactoseFree;
  final  int duration;

  final  Affordability ?affordability;
  final Complexity1 complexity;
   bool fav=false;


  Meal(
      {this.id,
      this.title,
      this.imageUrl,
      required this.categories,
      required this.ingredients,
      required this.steps,
      required this.isGlutenFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.isLactoseFree,
      required this.duration,
      this.affordability,
      required this.complexity});

}




