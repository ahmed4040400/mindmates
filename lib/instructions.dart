import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:mindmates/constants/mycolors.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Accordion(
      children: [
        AccordionSection(
          isOpen: true,
          headerBackgroundColor: CustomColors.mainBlue,
          headerBorderColor: CustomColors.mainBlue,
          headerPadding: const EdgeInsets.symmetric(vertical: 15),
          contentVerticalPadding: 20,
          leftIcon:
              const Icon(Icons.book, size: 35, color: CustomColors.skyBlue),
          header: const Text(
            'What is ADHD?',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
              "Attention-Deficit/Hyperactivity Disorder (ADHD) is a neurodevelopmental disorder characterized by symptoms of inattention, hyperactivity, and impulsivity. It can affect a child's ability to focus, control their behavior, and manage daily activities."),
        ),
        AccordionSection(
          isOpen: true,
          headerBackgroundColor: CustomColors.mainBlue,
          headerBorderColor: CustomColors.mainBlue,
          headerPadding: const EdgeInsets.symmetric(vertical: 15),
          contentVerticalPadding: 20,
          leftIcon:
              const Icon(Icons.book, size: 35, color: CustomColors.skyBlue),
          header: const Text(
            'How is ADHD diagnosed in children?',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
              "ADHD is diagnosed through a comprehensive evaluation by a healthcare professional. This typically involves gathering information from parents, teachers, and the child, as well as completing behavioral checklists and assessments to observe symptoms over time."),
        ),
        AccordionSection(
          isOpen: true,
          headerBackgroundColor: CustomColors.mainBlue,
          headerBorderColor: CustomColors.mainBlue,
          headerPadding: const EdgeInsets.symmetric(vertical: 15),
          contentVerticalPadding: 20,
          leftIcon:
              const Icon(Icons.book, size: 35, color: CustomColors.skyBlue),
          header: const Text(
            'What are the common symptoms of ADHD in children?',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
              "Common symptoms include difficulty paying attention or staying focused on tasks, frequent daydreaming, trouble following instructions and completing tasks, fidgeting or inability to sit still, excessive talking and interrupting others, acting impulsively without considering consequences, and difficulty organizing tasks and activities."),
        ),
        AccordionSection(
          isOpen: true,
          headerBackgroundColor: CustomColors.mainBlue,
          headerBorderColor: CustomColors.mainBlue,
          headerPadding: const EdgeInsets.symmetric(vertical: 15),
          contentVerticalPadding: 20,
          leftIcon:
              const Icon(Icons.book, size: 35, color: CustomColors.skyBlue),
          header: const Text(
            'What are some effective strategies for managing ADHD in children?',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
              "Effective strategies include behavioral therapy, which involves working with a therapist to develop coping mechanisms and behavior modification techniques. Medication, such as stimulant and non-stimulant drugs, can help manage symptoms. Establishing clear and consistent routines provides stability, and using positive reinforcement with rewards and praise encourages desired behaviors. Organizational tools like planners, checklists, and visual schedules aid in organization, while regular physical activity helps manage energy levels and improve focus."),
        ),
        AccordionSection(
          isOpen: true,
          headerBackgroundColor: CustomColors.mainBlue,
          headerBorderColor: CustomColors.mainBlue,
          headerPadding: const EdgeInsets.symmetric(vertical: 15),
          contentVerticalPadding: 20,
          leftIcon:
              const Icon(Icons.book, size: 35, color: CustomColors.skyBlue),
          header: const Text(
            'How can teachers support students with ADHD in the classroom?',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
              "Teachers can support students with ADHD by providing clear and concise instructions, breaking tasks into smaller, manageable steps, and using visual aids and hands-on activities. Allowing short breaks during tasks can prevent restlessness, and seating the child away from distractions can help them focus. Offering additional time for tests and assignments, and collaborating with parents and specialists to create an individualized education plan (IEP), are also effective strategies."),
        ),
        AccordionSection(
          isOpen: true,
          headerBackgroundColor: CustomColors.mainBlue,
          headerBorderColor: CustomColors.mainBlue,
          headerPadding: const EdgeInsets.symmetric(vertical: 15),
          contentVerticalPadding: 20,
          leftIcon:
              const Icon(Icons.book, size: 35, color: CustomColors.skyBlue),
          header: const Text(
            'What role do parents play in supporting their child with ADHD?',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
              "Parents play a crucial role in supporting their child with ADHD by maintaining open communication with teachers and healthcare providers to monitor progress and adjust strategies as needed. They can create a structured and supportive home environment with consistent routines and clear expectations. Positive reinforcement and patience are key, as is advocating for their child's needs in educational and social settings. Parents can also benefit from joining support groups to share experiences and gain insights from others facing similar challenges."),
        ),
                AccordionSection(
          isOpen: true,
          headerBackgroundColor: CustomColors.mainBlue,
          headerBorderColor: CustomColors.mainBlue,
          headerPadding: const EdgeInsets.symmetric(vertical: 15),
          contentVerticalPadding: 20,
          leftIcon:
              const Icon(Icons.book, size: 35, color: CustomColors.skyBlue),
          header: const Text(
            'What role do parents play in supporting their child with ADHD?',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
              "Parents play a crucial role in supporting their child with ADHD by maintaining open communication with teachers and healthcare providers to monitor progress and adjust strategies as needed. They can create a structured and supportive home environment with consistent routines and clear expectations. Positive reinforcement and patience are key, as is advocating for their child's needs in educational and social settings. Parents can also benefit from joining support groups to share experiences and gain insights from others facing similar challenges."),
        ),

      ],
    ));
  }
}
