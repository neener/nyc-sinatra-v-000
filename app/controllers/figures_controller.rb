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

	post '/figures/new' do
		figure = Figure.create(params[:figure])
		unless params[:title][:name].empty?
			figure.titles << Title.find_or_create_by(params[:title])
		end
		unless params[:landmark][:name].empty?
			figure.landmarks << Landmark.find_or_create_by(params[:landmark])
		end
		figure.save
		redirect "/figures/#{figure.id}"
	end

	post '/figures/:id/edit' do
		figure = Figure.find_by(id: params[:id])
		figure.update(params[:figure])
		unless params[:title][:name].empty?
			figure.titles << Title.find_or_create_by(params[:title])
		end
		unless params[:landmark][:name].empty?
			figure.landmarks << Landmark.find_or_create_by(params[:landmark])
		end
		figure.save
		redirect "/figures/#{figure.id}"
	end

end