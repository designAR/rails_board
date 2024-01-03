class QuestionsController < ApplicationController
    def index
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
        @question.save
        # showレダイレクト
        redirect_to @question
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
        def question_params
            params.require(:question).permit(:title, :name, :content)
        end

end
