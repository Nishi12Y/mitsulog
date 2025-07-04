module ApplicationHelper
    module MeeHelper
        def mee_message
          messages = [
            "素晴らしい一歩だね！その調子だよ",
            "きちんと向き合えてて、本当にかっこいい！",
            "前に進めたあなたが輝いてる！それで十分だよ",
            "それってとっても大切なこと！よく気づけたね",
            "その調子！あなたのペースで着実に進んでいこう",
            "気づけたあなたの感性が素敵！それだけで大きな成長だよ",
            "できたことを言葉にできるなんて、あなたって本当にすごい！",
            "おお〜！それ、めちゃくちゃいいじゃない！",
            "今日のあなたも最高だよ！自信を持って",
            "あなたらしいペースが一番素敵！そのまま進んでいこう"
          ]
          messages.sample
        end
    end

    # TODO：このメソッドはモデルに記述するべきかも
    def eligible_for_compliments?
      my_good_things = GoodThing
      .where(user: current_user)
      .select("DATE(created_at) as recorded_date")
      .distinct

      if my_good_things.size > 3
        return true
      end
      false
    end

    def daily_compliment_count
      current_user.compliments.where(created_at: Time.zone.today.all_day).count
    end

    def daily_compliment_limit_reached?
      daily_compliment_count >= 3
    end
end
