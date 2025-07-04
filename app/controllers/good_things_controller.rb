class GoodThingsController < ApplicationController
    include ApplicationHelper::MeeHelper

    def index
        # TODO: ページごとに取得するように変更する
        # TODO: 日付ごとにまとめて１つのカードに表示できるように取得の仕方を変更する。
        @good_things = current_user.good_things.all.order(created_at: :desc)
        @today_count = @good_things.where(created_at: Time.zone.today.all_day).count
    end

    def new
        @good_thing = GoodThing.new
    end

    def show
        @good_thing = current_user.good_things.find(params[:id])
    end

    def create
        @good_thing = current_user.good_things.build(good_thing_params)

        if @good_thing.save
            flash[:mee_message] = mee_message
            redirect_to new_good_thing_path, success: 'できたことを登録しました。'
        else
            flash.now[:danger] = 'できたことの登録に失敗しました。'
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @good_thing = current_user.good_things.find(params[:id])
            
        if @good_thing.update(good_thing_params)
            redirect_to good_things_path(@good_thing), success: 'できたことを更新しました。'
        else
            flash.now[:danger] = 'できたことの更新に失敗しました。'
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy

        good_thing = current_user.good_things.find(params[:id])
        good_thing.destroy!
        redirect_to good_things_path, success: 'できたことを削除しました。'
        
    end

    # TODO: ログインユーザーがすでに入力している褒め言葉を除く必要がある。
    def shared
        @shared_good_things = GoodThing.where.not(user: current_user)
        @compliment = Compliment.new
    end

    private

    def good_thing_params
        params.require(:good_thing).permit(:content, :praise)
    end
end
