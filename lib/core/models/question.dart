class Question {
  String question;
  String correctAnswer;
  List<String> possibleAnswers;

  Question({this.question, this.correctAnswer, this.possibleAnswers});

  Question.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    correctAnswer = json['correct_answer'];
    possibleAnswers = json['possible_answers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['possible_answers'] = this.possibleAnswers;
    return data;
  }
}
