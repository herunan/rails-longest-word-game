require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(9)
  end

  def score
    @input = params[:guess].upcase
    @grid = params[:grid]
    @match = @input.chars.all? do |letter|
      @input.count(letter) <= @grid.count(letter)
    end
    @dictionary = english_word?(@input)
    @splitGrid = @grid.split('').join(', ')
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end
end
