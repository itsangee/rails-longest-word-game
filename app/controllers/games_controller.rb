require "open-uri"

class GamesController < ApplicationController

  VOWELS = %w(A E I O U Y)

  def new
    @letters = ('a'..'z').to_a.min(10).shuffle
  end

  def score
    @letters = params[:letters].split
    @word = (params[:word] || '').upcase
    @include = include?(@word, @letters)
    @english_word = english_word?(@word)
  end

  private

  def include?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
