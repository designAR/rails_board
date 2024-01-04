class QuestionsController < ApplicationController
    # 質問一覧表紙
    def index
        @questions = Question.all
        p @questions
    end

    def show
        # p params[:id]
        @question = Question.find(params[:id])
        # p @question
    end

    def new
        @question = Question.new
    end

    # 質問の登録
    def create
        # p params
        # p question_params
        # Questionモデルを初期化
        @question = Question.new(question_params)
        # QuetionモデルをDBへ保存
        if @question.save
            # showレダイレクト
            redirect_to @question
        else
            render 'new', status: :unprocessable_entity
        end
    end

    # 質問の編集
    def edit
        @question = Question.find(params[:id])
    end

    # 質問の更新
    def update
        @question = Question.find(params[:id])
        if @question.update(question_params)
            redirect_to @question
        else
            render 'edit', status: :unprocessable_entity
        end

    end

    def destroy
    end

    private
        def question_params
            params.require(:question).permit(:title, :name, :content)
        end

end
