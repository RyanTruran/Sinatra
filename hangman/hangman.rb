require 'sinatra'
require 'sinatra/reloader'

$random_number=rand(100)
guess_string = ""
get '/' do
  guess = params["guess"].to_i
  guess_string = Check_Guess(guess)
  erb :index, :locals => {:random_number => $random_number, :guess_string => guess_string}
end
 # paint a line for each character
 # does character exist
 # if so where at
 # display character/
 # if not display new image
def Check_Guess(guess)
  if guess>$random_number
    return "Your guess was too high"
  elsif guess<$random_number
    return "Your guess was too low"
  elsif guess==$random_number
    return "You got it"
  end
end
