require 'nokogiri'
require 'open-uri'
class ParseController < ApplicationController
  def scrape
  	if params[:url].present?
  		page = Nokogiri::HTML(open(params[:url]))
  		content = Content.new
  		content.source_link = params[:url]
  		content.h1 = page.css('h1').map(&:text)
  		content.h2 = page.css('h2').map(&:text)
  		content.h3 = page.css('h3').map(&:text)
  		content.extracted_hrefs = page.css('a').map { |link| link['href'] }
  		content.save
  		render json: {message: "Url Parsed", data: content.as_json(:except => [:id, :created_at, :updated_at])} 
  	else
  		render json: {message: "Sorry no url found"}
  	end
  end

  def list
  	content = Content.all
  	render json: {message: "Url Parsed", data: content.as_json(:except => [:id, :created_at, :updated_at])} 
  end
end
