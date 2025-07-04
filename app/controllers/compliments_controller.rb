class ComplimentsController < ApplicationController

    def create
        @compliment = current_user.compliments.build(compliment_params)
        name = GoodThing.find(params[:good_thing_id]).user.name
        if @compliment.save
            flash[:success] = "#{name}さんへ褒め言葉を送りました。"
            redirect_to shared_good_things_path
        else
            flash[:danger] = '褒め言葉の送信に失敗しました。'
            redirect_to shared_good_things_path
            # render :index, status: :unprocessable_entity
        end
    end

    private

    def compliment_params
        params.require(:compliment).permit(:content).merge(good_thing_id: params[:good_thing_id])
    end
end
