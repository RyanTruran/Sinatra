require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

$count=0
$answer_array = [];
$remaining_count = 0;
$wrong_array = Array.new();

post '/set' do
  answer = params[:Answer].to_s.upcase!
  $answer_array = answer.split("")
  $guessed_array = Array.new($answer_array.count);
  $guessed_array.each_with_index do |letter,i|
  $guessed_array[i]="_";
  $count = 0;
  $wrong_array.clear;
  end
  $remaining_count = $answer_array.count;
  erb :game, :locals => {:answer => " ",:hang_count =>$count.to_s, :guessed_array =>$guessed_array.join(" ")  , :remaining_count =>$remaining_count, :wrong_array => " "}
end

post '/guess' do
  count = $count;
  correct=0;
  remaining_count = $remaining_count;
  guessed_array =$guessed_array;
  wrong_array = $wrong_array;
  $answer_array.each_with_index do |letter,i|
    if params[:guess].to_s.upcase ==letter
      guessed_array[i]=letter
      correct=1;
      remaining_count-=1;
    end
  end

  if correct==0
    count+=1
    wrong_array.push(params[:guess].to_s.upcase);
  end
  if count>6
    count=6
  end
  $remaining_count = remaining_count;
  $guessed_array = guessed_array;
  $count = count;

  if $remaining_count==0
    erb :index
  else
    erb :game, :locals => {:answer => params[:Answer],:hang_count =>count.to_s, :guessed_array =>$guessed_array.join(" "), :remaining_count =>$remaining_count, :wrong_array => $wrong_array.join(" ")}
  end
end
 # paint a line for each character
 # does character exist
 # if so where at
 # display character/
 # if not display new image
