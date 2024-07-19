import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mindmates/constants/mycolors.dart';
import 'package:mindmates/controllers/authController.dart';

List<Map<String, dynamic>> activitiesForADHD = [
  {
    "activity": "Puzzle Solving",
    "content":
        "Puzzle solving can enhance problem-solving skills. Start with simple puzzles and gradually increase difficulty, encouraging the child to focus and think critically.",
    "icon": Icons.extension // Represents problem-solving, creativity
  },
  {
    "activity": "Outdoor Sports",
    "content":
        "Engaging in outdoor sports like soccer or basketball can help improve focus and teamwork skills. It also provides a healthy outlet for excess energy.",
    "icon": Icons.sports_soccer // Represents sports activities
  },
  {
    "activity": "Art and Craft",
    "content":
        "Artistic activities can calm the mind and improve concentration. Provide various art supplies and let the child express creativity freely.",
    "icon": Icons.brush // Represents art and creativity
  },
  {
    "activity": "Music and Rhythm",
    "content":
        "Learning a musical instrument or participating in rhythm exercises can enhance cognitive functions and self-expression.",
    "icon": Icons.music_note // Represents music
  },
  {
    "activity": "Reading Together",
    "content":
        "Choose engaging and interactive books to read together. This can improve language skills and help the child learn to focus on tasks.",
    "icon": Icons.book // Represents reading
  },
  {
    "activity": "Mindfulness and Yoga",
    "content":
        "Practicing mindfulness and yoga can help reduce anxiety and improve attention spans. Start with simple poses and breathing exercises.",
    "icon": Icons.self_improvement // Represents mindfulness and yoga
  },
  {
    "activity": "Memory Games",
    "content":
        "Memory games can boost cognitive abilities and focus. Use cards or apps designed for children to make learning fun.",
    "icon": Icons.games // Represents games and memory improvement
  },
  {
    "activity": "Nature Walks",
    "content":
        "Walking in nature can be calming and therapeutic. Use these walks to teach the child about the environment and to practice mindfulness.",
    "icon": Icons.nature_people // Represents nature and outdoor activities
  },
  {
    "activity": "Gardening",
    "content":
        "Gardening can teach responsibility and patience, as well as offering a sensory experience that can be calming and grounding.",
    "icon":
        Icons.local_florist // Represents gardening and connection with nature
  },
  {
    "activity": "Cooking Simple Recipes",
    "content":
        "Cooking can improve focus and provide a rewarding way to learn about nutrition and following instructions.",
    "icon": Icons.kitchen // Represents cooking and culinary skills
  },
  {
    "activity": "Building Models or Lego",
    "content":
        "Building models or Lego can enhance fine motor skills, patience, and spatial awareness.",
    "icon": Icons.build // Represents construction and creativity
  },
  {
    "activity": "Swimming",
    "content":
        "Swimming is not only excellent physical exercise but also helps in improving focus and reducing stress.",
    "icon": Icons.pool // Represents swimming and aquatic activities
  },
  {
    "activity": "Board Games",
    "content":
        "Playing board games can improve strategic thinking, patience, and social skills.",
    "icon": Icons.dashboard // Represents strategy and social interaction
  },
  {
    "activity": "Dance and Movement",
    "content":
        "Dancing and movement activities can improve coordination, focus, and self-expression.",
    "icon": Icons.music_video // Represents dance and movement
  },
  {
    "activity": "Science Experiments",
    "content":
        "Simple science experiments can spark curiosity and improve critical thinking skills.",
    "icon": Icons.science // Represents science and experimentation
  },
  {
    "activity": "Role-Playing Games",
    "content":
        "Role-playing games can enhance creativity, social skills, and problem-solving abilities.",
    "icon": Icons.person // Represents role-playing and social interaction
  },
  {
    "activity": "Journaling",
    "content":
        "Encourage the child to keep a journal to express thoughts and emotions. This can improve self-awareness and emotional regulation.",
    "icon": Icons.bookmark // Represents writing and self-expression
  },
  {
    "activity": "Photography",
    "content":
        "Photography can help the child see the world from different perspectives and improve visual awareness.",
    "icon": Icons.camera // Represents photography and visual arts
  },
  {
    "activity": "Volunteering",
    "content":
        "Engaging in volunteer activities can boost self-esteem, empathy, and social skills.",
    "icon": Icons
        .volunteer_activism // Represents volunteering and community service
  },
  {
    "activity": "Coding and Programming",
    "content":
        "Learning to code can improve problem-solving skills, logical thinking, and creativity.",
    "icon": Icons.code // Represents coding and technology
  },
  {
    "activity": "DIY Projects",
    "content":
        "Encourage the child to work on DIY projects to enhance creativity, focus, and practical skills.",
    "icon": Icons.build_circle // Represents DIY and creativity
  },
];

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            for (var i = 0; i < activitiesForADHD.length; i++)
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: InkWell(
                  onTap: () {
                    AwesomeDialog(
                            context: Get.context!,
                            dialogType: DialogType.info,
                            animType: AnimType.rightSlide,
                            title: activitiesForADHD[i]["activity"],
                            desc: activitiesForADHD[i]["content"],
                            btnOkOnPress: () {},
                            btnOkColor: CustomColors.mainBlue)
                        .show();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        Icon(
                          activitiesForADHD[i]["icon"],
                          size: 50,
                          color: CustomColors.mainBlue,
                        ),
                        Text(
                          activitiesForADHD[i]["activity"],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
