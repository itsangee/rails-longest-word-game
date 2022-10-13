class GamesController < ApplicationController

  def score
    # params access then
    # compare the letters
    # check with api
  end

  def new
    @letters = ("a".."z").to_a.min(10).shuffle

  end
end
