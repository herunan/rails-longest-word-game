require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(9)
  end

  def score
    @input = params[:guess].upcase
    @outputLetters = params[:grid]
    @score = @input.chars.all? do |letter|
    binding.pry
      @input.count(letter) <= @outputLetters.count(letter)
    end
  end

  # def english_word?(word)
  #   response = open("https://wagon-dictionary.herokuapp.com/#{word}")
  #   json = JSON.parse(response.read)
  #   return json['found']
  # end

end
