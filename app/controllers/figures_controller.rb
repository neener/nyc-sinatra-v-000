class FiguresController < ApplicationController

	get '/figures' do
		@figure = Figure.all
		erb :'figures/index'
	end

	get '/figures/new' do
		erb :'figures/new'
	end

	get '/figures/:id' do
		@figure = Figure.find(params[:id])
		erb :'figures/show'
	end

	get '/figure/:id/edit' do
		@figure = Figure.find(params[:id])
		erb :'figures/edit'
	end

end