class QuestionsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :destroy]
  def index
    @questions = Question.all
    if params[:search] != nil
      @questions = Question.search(params[:search])
    end
    if params[:earth] != nil
      @questions = Question.earth
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question successfully added!"
      redirect_to new_question_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question= Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

private
  def question_params
    params.require(:question).permit(:question, :category, :user_id)
  end
end
