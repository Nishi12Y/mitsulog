class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  # 何も行わないアクションは１行で記述
  def top; end
end
