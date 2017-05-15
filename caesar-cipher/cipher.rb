require 'sinatra'
require 'sinatra/reloader'

cipher_string = ""

get '/' do
  erb :index
end

post '/' do
  string = params["string"]
  shift = params["shift"].to_i
  cipher_string = ceaser_cipher(string,shift)
  erb :ciphered, :locals => {:cipher_string => cipher_string}
end
 
def ceaser_cipher(string, shift=3)
  #take a string and copy to an array;
  chars=string.upcase.split("")
  conv=[]
  chars.each do |char|
    if char.match(/[[:alnum:]]/)
      asc = char.ord
      for i in 1..shift do
        asc=asc-1
        if asc===64
          asc=90
        end
      end
      conv.push(asc.chr)
    else
      conv.push(char)
    end
  end
  return conv.join("")
end

def Check_Guess(guess)
  if guess>$random_number
    return "Your guess was too high"
  elsif guess<$random_number
    return "Your guess was too low"
  elsif guess==$random_number
    return "You got it"
  end
end
