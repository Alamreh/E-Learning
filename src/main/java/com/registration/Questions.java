package com.registration;

public class Questions {
	@SuppressWarnings("unused")
	private int qid;
	private String question;
	private String correct_ans;
	public Questions()
	{
		
	}
	
	public Questions(int qid, String question, String correct_ans) {
		super();
		this.qid = qid;
		this.question = question;
		this.correct_ans = correct_ans;
	}

	public String getCorrect_ans() {
		return correct_ans;
	}
	public void setCorrect_ans(String correct_ans) {
		this.correct_ans = correct_ans;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	

}
