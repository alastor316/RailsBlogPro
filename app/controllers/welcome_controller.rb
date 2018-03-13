class WelcomeController < ApplicationController

    def index
        @articulos = Article.all
    end

    def contacto
        @contacts = Contact.new
    end
end