import 'dart:ffi';

import 'package:book_stack/utils/enum.dart';

class OldBookModel {
  String title;
  String author;
  String description;
  String imageName;
  String imageUrl;
  double rating;
  String color;
  String duration;
  String language;
  int pages;
  int pagesRead;
  int status;
  int category;
  bool isReading;
  bool isListening;

  OldBookModel({
    required this.title,
    required this.author,
    required this.description,
    required this.imageName,
    required this.imageUrl,
    required this.rating,
    required this.color,
    required this.duration,
    required this.language,
    required this.pages,
    required this.pagesRead,
    required this.status,
    required this.category,
    required this.isListening,
    required this.isReading,
  });

  factory OldBookModel.fromJson(Map<String, dynamic> json) {
    return OldBookModel(
      title: json['title'],
      author: json['author'],
      description: json['description'],
      imageName: json['imageName'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      color: json['color'],
      duration: json['duration'],
      language: json['language'],
      pages: json['pages'],
      pagesRead: json['pagesRead'],
      status: json['status'],
      category: json['category'],
      isListening: json['isListening'],
      isReading: json['isReading'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'imageName': imageName,
      'imageUrl': imageUrl,
      'rating': rating,
      'color': color,
      'duration': duration,
      'language': language,
      'pages': pages,
      'pagesRead': pagesRead,
      'status': status,
      'category': category,
      'isListening': isListening,
      'isReading': isReading,
    };
  }
}

List<OldBookModel> initializeBookModels() {
  List<Map<String, dynamic>> bookData = [
    {
      'name': 'Sparkle and friends',
      'color': '#f4ffcf',
      'author': 'Emily Johnson',
      'description':
          'Join Sparkle and her friends on magical adventures in the enchanted forest. Sparkle and Friends is a delightful tale of friendship, bravery, and teamwork, filled with whimsical creatures and thrilling escapades. With captivating storytelling and vibrant illustrations, this book sparks imagination and wonder.',
      'imageName': 'sparkle_friends_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fchildren_books%2Fresized%2Fsparkle_and_friends.png?alt=media&token=4d8726b5-f91b-404e-80da-597e682cb688",
      'ratings': 4.8,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 150,
      'status': BookStatus.newArrival.index,
      'category': BookCategory.children.index,
      'isListening': false,
      'isReading': false,
    },
    {
      'name': 'The tale of the kind bee',
      'color': '#f9e267',
      'author': 'Mariana Napolitan',
      'description':
          'Embark on a heartwarming journey with The Tale of the Kind Bee. This uplifting story follows a little bees quest to spread kindness and joy in the world. Through colorful illustrations and a touching narrative, this book inspires readers of all ages to make a difference.',
      'imageName': 'kind_bee_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fchildren_books%2Fresized%2Ftale_of_kind_bee.png?alt=media&token=9c5cb680-f92d-4dbc-b892-a038d9619242",
      'ratings': 4.5,
      'duration': '1.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 120,
      'status': BookStatus.newArrival.index,
      'category': BookCategory.children.index,
      'isListening': false,
      'isReading': false,
    },

    {
      'name': 'Olivias Diary',
      'color': '#00d7c6',
      'author': 'Olivia Johnson',
      'description':
          'Unlock the secrets of a hidden diary. Olivias Diary is a captivating mystery that takes readers on a journey through time and secrets. Follow Olivia as she unravels the mysteries of her family history, discovering truths that were buried in the past.',
      'imageName': 'olivias_diary_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fchildren_books%2Fresized%2Folivias_diary.png?alt=media&token=3ddb19dd-8260-46b9-9100-a44abfa02c57",
      'ratings': 4.5,
      'duration': '3.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 320,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.children.index,
    },
    {
      'name': 'Read With Me',
      'color': '#af8bd6',
      'author': 'Sarah Miller',
      'description':
          'Embark on a reading adventure with "Read With Me." This delightful book invites readers of all ages to explore the joys of storytelling and imagination. With enchanting tales and colorful illustrations, this book is perfect for cozy reading sessions and shared storytelling.',
      'imageName': 'read_with_me_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fchildren_books%2Fresized%2Fread_with_me.png?alt=media&token=c630b674-03ba-4fe0-bc2f-0bda69382d5c",
      'ratings': 4.8,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 180,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.children.index,
    },
    {
      'name': 'Play With Me',
      'color': '#fef6b1',
      'author': 'Margarita Perez',
      'description':
          'Let your imagination run wild and "Play With Me." This interactive book sparks creativity and playfulness, encouraging readers to engage in imaginative play and exploration. With interactive elements and engaging activities, this book is a delightful companion for playful minds.',
      'imageName': 'play_with_me_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fchildren_books%2Fresized%2Fplay_with_me.png?alt=media&token=87804a31-8f77-4a47-a583-9f6d5c8cd0fc",
      'ratings': 4.7,
      'duration': '1.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 200,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.children.index,
    },
    {
      'name': 'Fairy Tales from Rabbit Family',
      'color': '#f5f5db',
      'author': 'Lucy Johnson',
      'description':
          'Enter a world of enchantment with "Fairy Tales from Rabbit Family." This charming collection features timeless tales of adventure, friendship, and magic, starring the lovable characters from the Rabbit Family. With whimsical illustrations and heartwarming stories, this book is perfect for bedtime reading.',
      'imageName': 'fairy_tales_rabbit_family_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fchildren_books%2Fresized%2Ftales_from_rabbit_family.png?alt=media&token=b1b18400-650c-4548-96f9-c66032ca6dbf",
      'ratings': 4.7,
      'duration': '1 hour',
      'language': 'English',
      'pagesRead': 0,
      'pages': 100,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.children.index,
    },
    {
      'name': 'Animal names',
      'color': '#aed9fe',
      'author': 'Laura Taylor',
      'description':
          'Discover the wonders of the animal kingdom. "Animal Names" is an enchanting book that introduces readers to a variety of fascinating creatures, from the exotic to the familiar. With vibrant illustrations and engaging facts, this book is perfect for young explorers and animal lovers alike.',
      'imageName': 'animal_names_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fchildren_books%2Fresized%2Fanimal_names.png?alt=media&token=315db0f3-fa05-4483-9eca-fbbbb69cc4bc",
      'ratings': 4.9,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 150,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.children.index,
    },

    ///COOKING

    {
      'name': 'Baking Recipe',
      'color': '#f4a5af',
      'author': 'Baker Betty',
      'description':
          'Indulge in the art of baking with "Baking Recipe." This delightful cookbook features a medley of sweet and savory recipes, perfect for baking enthusiasts. From cakes to pastries, this book provides step-by-step instructions for creating mouthwatering treats.',
      'imageName': 'baking_recipe_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fcooking%2Fresized%2Fbaking_recipe.png?alt=media&token=8bce8c88-36ef-4fa0-bf34-c47fce6d9d1a",
      'ratings': 4.7,
      'duration': '1.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 130,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.cooking.index,
    },

    {
      'name': 'Cookbook Simply Recipes',
      'color': '#c6af98',
      'author': 'Chef Emily',
      'description':
          'Explore the art of cooking with "Cookbook Simply Recipes." This culinary masterpiece features a collection of simple yet delicious recipes, perfect for home cooks of all skill levels. From appetizers to desserts, this cookbook has something to tantalize every palate.',
      'imageName': 'cookbook_simply_recipes_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fcooking%2Fresized%2Fcookbook_simple_recipes.png?alt=media&token=8be191f7-e9f0-415d-9cc5-1fc7eb962887",
      'ratings': 4.9,
      'duration': '1 hour',
      'language': 'English',
      'pagesRead': 0,
      'pages': 120,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.cooking.index,
    },
    {
      'name': 'Learn to Cook',
      'color': '#fffaee',
      'author': 'Ndemi Otieno',
      'description':
          'Embark on a culinary journey and "Learn to Cook." This comprehensive guidebook covers the essentials of cooking, from basic techniques to advanced recipes. Whether you\'re a novice or seasoned cook, this book is your ultimate companion in the kitchen.',
      'imageName': 'learn_to_cook_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fcooking%2Fresized%2Flearn_to_cook.png?alt=media&token=7d602fd7-32cb-493d-bb58-be216fb1dd4c",
      'ratings': 4.8,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 160,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.cooking.index,
    },
    {
      'name': "Mabel's Kitchen",
      'color': '#6678ad',
      'author': 'Mabel Brown',
      'description':
          "Step into Mabel's Kitchen and discover the joy of home cooking. This charming cookbook features a collection of family recipes passed down through generations, celebrating the warmth and nostalgia of homemade meals. From comforting classics to innovative dishes, this book is a culinary treasure.",
      'imageName': 'mabels_kitchen_image.png',
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fcooking%2Fresized%2Fmabels_kitchen.png?alt=media&token=2dec2a75-114b-4376-ae13-7f883d66922a",
      'ratings': 4.9,
      'duration': '1.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 140,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.cooking.index,
    },
    {
      'name': 'My Recipe Book',
      'color': '#eeebe1',
      'author': 'Chef James',
      'description':
          'Create culinary delights with "My Recipe Book." This comprehensive cookbook features a curated collection of recipes for every occasion, from everyday meals to special celebrations. With clear instructions and helpful tips, this book is a must-have for aspiring chefs.',
      'imageName': 'my_recipe_book_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fcooking%2Fresized%2Fmy_recipe_book.png?alt=media&token=0d613f44-0e3a-40cf-8c18-e75b76223acd',
      'ratings': 4.8,
      'duration': '1.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 150,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.cooking.index,
    },

    {
      'name': 'My Secret Recipe Book',
      'color': '#fdd2bf',
      'author': 'Olivia Wilson',
      'description':
          'Unlock the secrets of gourmet cooking with "My Secret Recipe Book." This culinary treasure trove features exclusive recipes and insider tips from top chefs around the world. Elevate your culinary skills and impress your guests with delectable dishes.',
      'imageName': 'secret_recipe_book_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fcooking%2Fresized%2Fmy_secret_recipe_book.png?alt=media&token=5ced6e77-e54d-4d4d-8a19-f2e8a094a08d',
      'ratings': 4.9,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 180,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.cooking.index,
    },

//DRAMA

    {
      'name': 'Ranch',
      'color': '#875f00',
      'author': 'Oliver Johnson Wilson',
      'description':
          'Experience life on the ranch with "Ranch." This picturesque book captures the beauty of rural life, from rolling plains to grazing cattle. With stunning photography and insightful narratives, this book is a celebration of the ranching lifestyle and the natural wonders of the countryside.',
      'imageName': 'ranch_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fdrama%2Fresized%2Franch.png?alt=media&token=8a293e63-965c-44d8-81b5-64c14c3a8649',
      'ratings': 4.8,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 160,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.drama.index,
    },
    {
      'name': 'Rise',
      'color': '#ff0055',
      'author': 'Neil Tran',
      'description':
          'Experience the journey of rising above challenges in "Rise." This empowering book shares stories of resilience, determination, and personal growth. With inspiring narratives and motivational insights, this book encourages readers to embrace change and reach new heights in life.',
      'imageName': 'rise_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fdrama%2Fresized%2Frise.png?alt=media&token=10ac43e9-1e4e-4a25-977b-a17713296cc5',
      'ratings': 4.7,
      'duration': '2.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 170,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.drama.index,
    },
    {
      'name': 'Roman',
      'color': '#a8815a',
      'author': 'Christopher Martin',
      'description':
          'A tale of ambition, betrayal, and redemption. "Roman" transports readers to the heart of ancient Rome, where power struggles and political intrigue shape the destiny of empires. With rich historical detail and compelling characters, this book brings history to life in a thrilling narrative.',
      'imageName': 'roman_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fdrama%2Fresized%2Froman.png?alt=media&token=7661750e-d640-4764-9b8e-77b9adf43ea1',
      'ratings': 4.3,
      'duration': '4.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 390,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.drama.index,
    },

    {
      'name': 'Solo',
      'color': '#ff9966',
      'author': 'Michael White',
      'description':
          'Embark on a solo adventure with "Solo." This inspiring book celebrates the joys and challenges of solo travel, from soul-searching journeys to daring expeditions. With captivating stories and practical tips, this book is a companion for those who seek the thrill of exploration on their own.',
      'imageName': 'solo_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fdrama%2Fresized%2Fsolo.png?alt=media&token=6a6b3630-7d0a-461c-be56-7e9980f286a9',
      'ratings': 4.7,
      'duration': '2.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 170,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.drama.index,
    },
    {
      'name': 'Spear',
      'color': '#3f3067',
      'author': 'David Smith',
      'description':
          'Journey into the realm of warriors and legends with "Spear." This captivating book explores the history and significance of spears in warfare and culture. From ancient battlefields to modern symbolism, this book is a tribute to the enduring legacy of the spear in human history.',
      'imageName': 'spear_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fdrama%2Fresized%2Fspear.png?alt=media&token=f2f793c4-5f25-4ce1-bbf5-caade9706d0f',
      'ratings': 4.6,
      'duration': '2.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 170,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.drama.index,
    },

    {
      'name': 'The Conqueror',
      'color': '#3f3067',
      'author': 'David Johnson',
      'description':
          'Follow the path of conquest and glory in "The Conqueror." This epic book chronicles the rise of empires and the triumphs of legendary conquerors. From ancient battles to modern conquests, this book delves into the strategies and stories of those who shaped history through conquest.',
      'imageName': 'conqueror_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fdrama%2Fresized%2Fthe_conqourer.png?alt=media&token=a23e7c77-4ffb-4e87-9ac2-092a7a784d10',
      'ratings': 4.6,
      'duration': '3 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 180,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.drama.index,
    },

    ///FANTASY
    {
      'name': 'The wicked princess',
      'color': '#001f3d',
      'author': 'Claudia Wilson',
      'description':
          'In the kingdom of darkness, a princess embraces her destiny. "The Wicked Princess" is a captivating tale of courage and redemption, where the boundaries between good and evil blur. Join Princess Elena as she navigates through treacherous paths to reclaim her throne and her honor.',
      'imageName': 'wicked_princess_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Ffantasy%2Fresized%2Fthe_wicked_princess.png?alt=media&token=cf489115-a96e-4d3b-8104-439e4f834f03',
      'ratings': 4.4,
      'duration': '4.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 380,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.fantasy.index,
    },
    {
      'name': 'The young wizard',
      'color': '#048084',
      'author': 'Aaron Loeb',
      'description':
          'Step into the magical world of wizards and sorcery. "The Young Wizard" follows the journey of a gifted young apprentice as he masters the arcane arts and faces the challenges of a perilous quest. This spellbinding tale will enchant readers of all ages with its blend of adventure and magic.',
      'imageName': 'young_wizard_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Ffantasy%2Fresized%2Fthe_young_wizard.png?alt=media&token=ab66ad7d-e093-445b-b202-b191b33922af',
      'ratings': 4.7,
      'duration': '5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 400,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.fantasy.index,
    },

    {
      'name': 'Conquest of flames',
      'color': '#034c5f',
      'author': 'Shawn Garcia',
      'description':
          'Witness the epic saga of fire and fury in "Conquest of Flames." This thrilling book follows the journey of heroes and villains, where battles ignite passions and destinies are forged in the flames of conflict. With epic battles and heroic deeds, this book is a tribute to courage and resilience.',
      'imageName': 'conquest_flames_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Ffantasy%2Fresized%2Fconquest_of_flames.png?alt=media&token=e66e1de9-c864-407b-b468-4f2c89276cc1',
      'ratings': 4.7,
      'duration': '3 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 190,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.fantasy.index,
    },
    {
      'name': 'Rising ashes',
      'color': '#d54b5a',
      'author': 'Sarah Testor',
      'description':
          'From the ashes of destruction rises hope in "Rising Ashes." This gripping book chronicles tales of resilience and rebirth in the face of adversity. With powerful narratives and poignant stories, this book reminds us that even in the darkest times, there is light and the strength to rise again.',
      'imageName': 'rising_ashes_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Ffantasy%2Fresized%2Frising_ashes.png?alt=media&token=75f2d248-3b58-4ad9-ada2-e85a1c8ff104',
      'ratings': 4.7,
      'duration': '3 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 190,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.fantasy.index,
    },
    {
      'name': 'Sword',
      'color': '#e6cb96',
      'author': 'Olivia Wilson',
      'description':
          'Unleash the power of the sword in "Sword." This epic book delves into the art of swordsmanship and the legends of legendary blades. From ancient warriors to modern duels, this book explores the mystique and mastery of the sword in history and fiction.',
      'imageName': 'sword_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Ffantasy%2Fresized%2Fsword.png?alt=media&token=5f9a69f7-ab17-4dbb-a337-5e3d165f1ce1',
      'ratings': 4.6,
      'duration': '2.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 180,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.fantasy.index,
    },

    //MYSTERY

    {
      'name': 'Soul',
      'color': '#d09b6b',
      'author': 'Olivia Wilson',
      'description':
          'Exploring the essence of being, "Soul" delves into the deepest corners of human existence. Through captivating narratives and insightful reflections, this book invites readers on a transformative journey of introspection and enlightenment, illuminating the path to self-discovery.',
      'imageName': 'soul_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fmystery%2Fresized%2Fsoul_cover.png?alt=media&token=cb0404b6-6628-4c6d-a89b-1791df3b3694',
      'ratings': 4.5,
      'duration': '2.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 280,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.mystery.index,
    },

    {
      'name': 'The Girl in the woods',
      'color': '#a1b1e3',
      'author': 'Emily Wilson',
      'description':
          'Lost in the wilderness, a young girl discovers the secrets of nature and herself. "The Girl in the Woods" is an enchanting tale of adventure and self-discovery, weaving together elements of magic and wonder in a captivating narrative that will leave readers spellbound.',
      'imageName': 'girl_in_woods_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fmystery%2Fresized%2Fthe_girl_in_the_woods_cover.png?alt=media&token=8dc429cd-052f-4d54-ba3c-f47877278ae5',
      'ratings': 4.0,
      'duration': '4 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 360,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.mystery.index,
    },
    {
      'name': 'The Mirror of destiny',
      'color': '#07090f',
      'author': 'Sebastian Bennet',
      'description':
          'Peer into the reflections of fate with "The Mirror of Destiny." This captivating book explores the twists and turns of life\'s journey, where choices shape destinies and destinies reveal truths. With compelling narratives and unexpected revelations, this book is a mirror to the human experience.',
      'imageName': 'mirror_destiny_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fmystery%2Fresized%2Fthe_mirror_of_destiny.png?alt=media&token=4e348577-5661-4362-a8ab-fe58b985e694',
      'ratings': 4.7,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 150,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.mystery.index,
    },

    {
      'name': 'The whispering Throne',
      'color': '#010101',
      'author': 'Francois Mercer',
      'description':
          'Enter a realm of intrigue and power with "The Whispering Throne." This gripping book unravels the secrets of kingdoms and rulers, where whispers hold more sway than swords. With political intrigue and complex characters, this book is a thrilling journey into the heart of royalty.',
      'imageName': 'whispering_throne_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fmystery%2Fresized%2Fthe_whispering_throne.png?alt=media&token=8687b1ea-ca8f-4e38-a0da-8b9ba838f6af',
      'ratings': 4.8,
      'duration': '3 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 180,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.mystery.index,
    },
    {
      'name': 'Walk into the shadow',
      'color': '#586b3a',
      'author': 'Estelle Darcy',
      'description':
          'Explore the shadows of the unknown with "Walk Into the Shadow." This intriguing book delves into mysteries and secrets hidden in plain sight, where shadows hold clues to deeper truths. With suspenseful storytelling and unexpected twists, this book keeps readers on the edge of their seats.',
      'imageName': 'walk_shadow_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fmystery%2Fresized%2Fwalk_into_the_shadow.png?alt=media&token=9dfe69ed-eb1c-40e3-8c76-e3024fa87c75',
      'ratings': 4.6,
      'duration': '2.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 170,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.mystery.index,
    },

//ROMANCE
    {
      'name': 'Just the two of us',
      'color': '#207ffe',
      'author': 'Aaron Loeb',
      'description':
          'Discover the beauty of companionship with "Just the Two of Us." This heartwarming book celebrates the bond between two souls, navigating life\'s journey together. With touching anecdotes and heartfelt moments, this book is a tribute to the power of friendship and love.',
      'imageName': 'two_of_us_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fromance%2Fresized%2Fjust_the_two_of_us.png?alt=media&token=aed5d1d1-c0f9-4753-b6df-f9c9ca91dae0',
      'ratings': 4.6,
      'duration': '1.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 130,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.romance.index,
    },
    {
      'name': 'Love story',
      'color': '#ffdad7',
      'author': 'Lornam Alvarado',
      'description':
          'Celebrate the magic of love with "Love Story." This enchanting book weaves together tales of romance, passion, and enduring love. From classic love stories to modern romances, this book captures the essence of love in all its forms, reminding us that love is a timeless and universal language.',
      'imageName': 'love_story_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fromance%2Fresized%2Flove_story.png?alt=media&token=ac6a17e2-94f3-43d5-9e39-5da06e2cd31c',
      'ratings': 4.7,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 150,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.romance.index,
    },
    {
      'name': 'My First Love',
      'color': '#a64c5e',
      'author': 'Olivia Wilson',
      'description':
          'A nostalgic journey into first love. "My First Love" captures the innocence and excitement of youthful romance, evoking memories of tender moments and heart-fluttering emotions. With a timeless charm, this book reminds us of the magic of falling in love for the first time.',
      'imageName': 'first_love_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fromance%2Fresized%2Fmy_first_love.png?alt=media&token=bae4c44c-6718-45b3-a365-ce178ae1112e',
      'ratings': 4.7,
      'duration': '3 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 280,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.romance.index,
    },
    {
      'name': 'Our first autumn',
      'color': '#ffb358',
      'author': 'Noah Schumacher',
      'description':
          'Experience the beauty of change with "Our First Autumn." This poignant book captures the essence of autumn, with its vibrant colors and nostalgic charm. Through evocative prose and stunning imagery, this book invites readers to embrace the seasons of life and cherish moments of transition.',
      'imageName': 'first_autumn_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fromance%2Fresized%2Four_first_autum.png?alt=media&token=b8ce1b9f-12e7-40dd-8b4b-c8e4ca8a7626',
      'ratings': 4.8,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 140,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.romance.index,
    },
    {
      'name': 'Our Secret love',
      'color': '#481736',
      'author': 'Claudia Wilson',
      'description':
          'A forbidden love, a secret passion. "Our Secret Love" delves into the complexities of hidden desires and the struggle to keep love aflame in the shadows. With evocative prose and poignant moments, this book explores the depths of human emotions.',
      'imageName': 'secret_love_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fromance%2Fresized%2Four_secret_love.png?alt=media&token=d8adb704-cf00-4d6a-a29f-33c55c08e9e9',
      'ratings': 4.6,
      'duration': '4 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 370,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.romance.index,
    },
    {
      'name': 'Story about you and me',
      'color': '#202a4e',
      'author': 'Hae-Won Jeon',
      'description':
          'A heartwarming tale of love and friendship. "Story About You and Me" takes readers on a journey through the highs and lows of relationships, celebrating the bonds that connect us all. With poignant storytelling and relatable characters, this book captures the essence of human connection.',
      'imageName': 'story_about_you_and_me_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fromance%2Fresized%2Fstory_about_you_and_me.png?alt=media&token=477f3415-b697-4a76-977c-a9ffd5ceb3d2',
      'ratings': 4.8,
      'duration': '3.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 350,
      'status': BookStatus.newArrival.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.romance.index,
    },

    //SELF-HELP
    {
      'name': 'How to manage your Energy',
      'color': '#374c80',
      'author': 'Eleanor FitzGerald',
      'description':
          'Master the art of energy management with "How to Manage Your energy." This practical guide offers effective techniques and strategies to optimize productivity and achieve work-life balance. From prioritization to delegation, this book equips you with the tools to make the most of your energy.',
      'imageName': 'manage_time_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fself_help%2Fresized%2Fhow_to_manage_your_time.png?alt=media&token=acce7a9d-5e62-40e5-bb69-dc4ee57d0743',
      'ratings': 4.8,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 160,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.selfHelp.index,
    },
    {
      'name': 'It\'s okay',
      'color': '#f4a261',
      'author': 'Dr. Daniel Gallego',
      'description':
          'Find solace and strength in "It\'s Okay." This comforting book shares affirmations and reminders that it\'s okay to feel, to heal, and to be imperfectly human. With gentle reminders and soothing words, this book offers a sense of compassion and acceptance in challenging times.',
      'imageName': 'its_okay_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fself_help%2Fresized%2Fits_okay.png?alt=media&token=d6a1194a-4678-411e-a38e-ee602593a92c',
      'ratings': 4.8,
      'duration': '1.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 140,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.selfHelp.index,
    },
    {
      'name': 'Mindfulness for beginners',
      'color': '#f6bd60',
      'author': 'Michael Wilson',
      'description':
          'Embark on a journey of mindfulness with "Mindfulness for Beginners." This beginner-friendly guide introduces mindfulness practices for reducing stress, enhancing focus, and cultivating inner peace. With simple exercises and mindful tips, this book is a stepping stone to a more mindful life.',
      'imageName': 'mindfulness_beginners_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fself_help%2Fresized%2Fmindfulness_for_beginners.png?alt=media&token=4f7987b8-08aa-41fd-af90-4def7069ee7c',
      'ratings': 4.7,
      'duration': '1.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 130,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.selfHelp.index,
    },
    {
      'name': 'The power of balance',
      'color': '#ffa372',
      'author': 'Resee Miller',
      'description':
          'Discover the transformative power of balance in "The Power of Balance." This insightful book explores the importance of equilibrium in life, from physical well-being to emotional harmony. With practical advice and holistic approaches, this book guides you towards a balanced and fulfilling lifestyle.',
      'imageName': 'power_balance_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fself_help%2Fresized%2Fthe_power_of_balance.png?alt=media&token=a5b76654-283d-4ba2-a7c2-ab3f88024530',
      'ratings': 4.6,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 150,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.selfHelp.index,
    },
    {
      'name': 'Thinking Techniques',
      'color': '#8ecae6',
      'author': 'Estelle Darcy',
      'description':
          'Explore the power of thinking with "Thinking Techniques." This insightful book introduces cognitive strategies and mental frameworks for enhancing creativity, problem-solving, and decision-making. With practical exercises and thought-provoking concepts, this book expands your thinking horizons.',
      'imageName': 'thinking_techniques_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fself_help%2Fresized%2Fthinking_techniques.png?alt=media&token=38b2ab3c-205d-4321-a05a-eb38c2de754f',
      'ratings': 4.6,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 150,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.selfHelp.index,
    },

    {
      'name': 'Unlock your true potentials',
      'color': '#003f5c',
      'author': 'Olivia Watson',
      'description':
          'Discover the keys to unlocking your true potential in "Unlock Your True Potentials." This insightful book provides practical strategies and mindset shifts to help you unleash your capabilities and achieve your goals. With actionable advice and empowering perspectives, this book is a guide to personal transformation.',
      'imageName': 'unlock_potentials_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fself_help%2Fresized%2Ftrue_potential.png?alt=media&token=0d2ee352-fcd8-46e9-bb70-166a8bdb3a2a',
      'ratings': 4.7,
      'duration': '2.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 170,
      'status': BookStatus.popular.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.selfHelp.index,
    },

    //Thriller

    {
      'name': 'Alone',
      'color': '#101010',
      'author': 'Morgan Maxwell',
      'description':
          'In the midst of darkness, a solitary figure stands against the tides of time. "Alone" is a gripping tale of solitude, weaving a narrative of introspection and resilience. Follow Alex as he navigates through the labyrinth of his mind, seeking answers to life\'s most profound questions.',
      'imageName': 'alone_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fthriller%2Fresized%2Falone_cover.png?alt=media&token=05d93e4b-32ec-48f7-b6d6-f2afb21d262f',
      'ratings': 4.2,
      'duration': '3 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 320,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.thriller.index,
    },

    {
      'name': 'Beauty of the night',
      'color': '#d2dbda',
      'author': 'Benjamin Shan',
      'description':
          'Discover the enchanting allure of the night with "Beauty of the Night." This captivating book celebrates the mysteries and wonders of the nocturnal world, from starlit skies to moonlit landscapes. With evocative prose and stunning illustrations, this book is a tribute to the magic of nighttime.',
      'imageName': 'beauty_of_night_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fthriller%2Fresized%2Fbeauty_of_the_night.png?alt=media&token=6ffc6515-9c58-4cdb-9597-d53772e5530f',
      'ratings': 4.6,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 140,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.thriller.index,
    },

    {
      'name': 'Freedom',
      'color': '#015ab7',
      'author': 'Samntha Wilson',
      'description':
          'Experience the essence of freedom with "Freedom." This captivating book explores the concept of liberty in its various forms, from personal freedoms to societal ideals. Through thought-provoking essays and inspiring stories, this book invites readers to reflect on the meaning of freedom in their lives.',
      'imageName': 'freedom_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fthriller%2Fresized%2Ffreedom.png?alt=media&token=f4b971e6-1d81-4227-b65b-5913a74adf42',
      'ratings': 4.5,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 160,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.thriller.index,
    },

    {
      'name': 'In Your Eyes',
      'color': '#110908',
      'author': 'Margarita Perez',
      'description':
          'Dive into the depths of emotions with "In Your Eyes." This evocative collection of poems and reflections explores love, loss, and the human experience through heartfelt verses and poignant imagery. With raw honesty and lyrical prose, this book resonates with the essence of being.',
      'imageName': 'in_your_eyes_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fthriller%2Fresized%2Fin_your_eyes.png?alt=media&token=ec6f5ba0-1f84-48aa-b641-51de6681bd16',
      'ratings': 4.7,
      'duration': '1 hour',
      'language': 'English',
      'pagesRead': 0,
      'pages': 110,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.thriller.index,
    },

    {
      'name': 'Silence',
      'color': '#c9c1c2',
      'author': 'Olivia Wilson',
      'description':
          'Enter the world of silence and introspection. "Silence" is a contemplative journey through the depths of inner peace and mindfulness. With serene landscapes and meditative reflections, this book offers solace and inspiration for those seeking moments of quietude in a busy world.',
      'imageName': 'silence_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fthriller%2Fresized%2Fsilence.png?alt=media&token=7288a3da-1f06-4320-9ad0-65e8c6049611',
      'ratings': 4.4,
      'duration': '1.5 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 130,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.thriller.index,
    },
    {
      'name': 'The village',
      'color': '#5c5f5f',
      'author': 'Michael Brown',
      'description':
          'Explore the charm and simplicity of "The Village." This picturesque book transports readers to a quaint village nestled in the countryside, where timeless traditions and close-knit communities thrive. With evocative illustrations and heartwarming stories, this book captures the essence of rural life.',
      'imageName': 'village_image.png',
      'imageUrl':
          'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Fthriller%2Fresized%2Fthe_village.png?alt=media&token=a247060b-382d-468d-857d-9f7a9126f35c',
      'ratings': 4.6,
      'duration': '2 hours',
      'language': 'English',
      'pagesRead': 0,
      'pages': 140,
      'status': BookStatus.free.index,
      'isListening': false,
      'isReading': false,
      'category': BookCategory.thriller.index,
    },

    // /NEXT

    // {
    //   'name': 'Conquest of flames',
    //   'color': '#034c5f',
    //   'author': 'Shawn Garcia',
    //   'description':
    //       'Witness the epic saga of fire and fury in "Conquest of Flames." This thrilling book follows the journey of heroes and villains, where battles ignite passions and destinies are forged in the flames of conflict. With epic battles and heroic deeds, this book is a tribute to courage and resilience.',
    //   'imageName': 'conquest_flames_image.png',
    //   'imageUrl':
    //       'https://firebasestorage.googleapis.com/v0/b/bridgetech-advance-project.appspot.com/o/book_stack%2Fbook_images%2Ffantasy%2Fresized%2Fconquest_of_flames.png?alt=media&token=e66e1de9-c864-407b-b468-4f2c89276cc1',
    //   'ratings': 4.7,
    //   'duration': '3 hours',
    //   'language': 'English',
    //   'pages': 190,
    //   'status': BookStatus.available,
    //   'category': 'Fantasy',
    // },
  ];

  List<OldBookModel> bookModels = bookData.map((data) {
    return OldBookModel(
      title: data['name'],
      author: data['author'],
      description: data['description'],
      imageName: data['imageName'],
      imageUrl: data['imageUrl'],
      rating: data['ratings'],
      duration: data['duration'],
      language: data['language'],
      pages: data['pages'],
      status: data['status'],
      category: data['category'],
      color: data['color']!,
      isListening: data['isListening'],
      isReading: data['isReading'],
      pagesRead: data['pagesRead'],
    );
  }).toList();

  return bookModels;
}

// void main() {
//   List<BookModel> books = initializeBookModels();
//   for (var book in books) {
//     print('Name: ${book.name}, Color: ${book.color}, Author: ${book.author}, Category: ${book.category}');
//   }
// }
