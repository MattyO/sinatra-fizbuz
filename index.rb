require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public'
FIZ=3
BUZ=5

def type number
  if number % FIZ == 0 && number % BUZ == 0
    'FizBuz'
  elsif number % FIZ == 0
    'Fiz'
  elsif number % BUZ ==0
    'Buz'
  else
    'just a number :('
  end
end

def genList startDiget=0, endDiget
  counter = startDiget
  list= Array.new

  while counter <= endDiget 
    list.push({number:counter, type: type(counter)})
    counter += 1
  end

  list
end

get '/' do
  puts 'on index page'
  erb :index
end

get %r{^/(\d+)$} do |number|
  erb :single, :locals =>{number:number.to_i , type: type(number.to_i), FIZ: FIZ, BUZ: BUZ}
end

get %r{^/list/(\d+)-(\d+)$} do
  startD = params[:captures][0].to_i
  endD = params[:captures][1].to_i
  list = genList(startD, endD)

  erb :list, :locals => {list:list,FIZ: FIZ, BUZ: BUZ}
end

get %r{^/list/(\d+)$} do |listSize|
  list = genList listSize.to_i

  erb :list, :locals => {list:list}
end

a = {:a => 1, :b=> 2}
