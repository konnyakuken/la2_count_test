require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
  end
end

get "/" do
  @number=Count.find(1).number
  erb :index
end

post "/plus" do
  num=Count.find(1)
  num.number +=1
  num.save
  redirect "/"
end

post "/minus" do
  num=Count.find(1)
  num.number -=1
  num.save
  redirect "/"
end

post "/clear" do
  num=Count.find(1)
  num.number =0
  num.save
  redirect "/"
end

post "/kakeru" do
  num=Count.find(1)
  num.number *=2
  num.save
  redirect "/"
end

post "/waru" do
  num=Count.find(1)
  num.number /=2
  num.save
  redirect "/"
end

post "/plus2" do
  num=Count.find(2)
  num.number +=1
  num.save
  redirect "/"
end