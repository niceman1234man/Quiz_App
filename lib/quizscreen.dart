import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;
  bool _quizStarted = false;

  List<Map<String, dynamic>> _quizData = [
    {
      'question': 'What is the capital of Germany?',
      'options': ['Berlin', 'Paris', 'London', 'Rome'],
      'answer': 'Berlin',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Mars', 'Jupiter', 'Venus', 'Saturn'],
      'answer': 'Mars',
    },
    {
      'question': 'Who painted the Mona Lisa?',
      'options': [
        'Leonardo da Vinci',
        'Pablo Picasso',
        'Vincent van Gogh',
        'Michelangelo'
      ],
      'answer': 'Leonardo da Vinci',
    },
  ];

  List<String?> _selectedAnswers = List<String?>.filled(3, null);
  List<String?> _userChoices = List<String?>.filled(3, null);

  void _startQuiz() {
    setState(() {
      _quizStarted = true;
    });
  }

  void _answerQuestion(String selectedAnswer) {
    if (selectedAnswer == _quizData[_questionIndex]['answer']) {
      setState(() {
        _score++;
      });
    }

    setState(() {
      _selectedAnswers[_questionIndex] = selectedAnswer;
      _userChoices[_questionIndex] = selectedAnswer;
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      _selectedAnswers = List<String?>.filled(3, null);
      _userChoices = List<String?>.filled(3, null);
      _quizStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: _quizStarted
          ? _questionIndex < _quizData.length
              ? Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        _quizData[_questionIndex]['question'],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors
                              .white, // Set the color of the question to white
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ...(_quizData[_questionIndex]['options'] as List<String>)
                        .map((option) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 8),
                        child: ElevatedButton(
                          onPressed: () => _answerQuestion(option),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 59, 6,
                                  72), // Set the custom background color for the button
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 83, 6,
                                  79), // Set the custom background color for the choice
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              option,
                              style: const TextStyle(
                                color: Colors
                                    .white, // Set the text color for the choice
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Quiz Completed!',
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Your Score: $_score out of ${_quizData.length}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 16),
                      for (int i = 0; i < _quizData.length; i++) ...[
                        const SizedBox(height: 16),
                        Text(
                          'Question ${i + 1}: ${_quizData[i]['question']}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Correct Answer: ${_quizData[i]['answer']}',
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your Choice: ${_userChoices[i]}',
                          style: const TextStyle(
                              color:
                                  Colors.white), // Set the text color to white
                        ),
                      ],
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _resetQuiz,
                        child: const Text('Restart Quiz'),
                      ),
                    ],
                  ),
                )
          : Center(
              child: ElevatedButton(
                onPressed: _startQuiz,
                child: const Text('Start Quiz'),
              ),
            ),
    );
  }
}
