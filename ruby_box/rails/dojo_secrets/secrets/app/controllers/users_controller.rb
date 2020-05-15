class UsersController < ApplicationController

    skip_before_filter :require_login, :only => [:create,:new]
    before_action :check_user, only: [:edit, :show, :update, :delete]
    def new
    end
    
    def create
        puts params['Name']
        puts params['Email']
        @user = User.new(name: params['Name'], email: params['Email'], password: params['Password'], password_confirmation: params['Password_Confirmation'])
        if @user.valid?
            @user.save
            redirect_to '/sessions/new'
        else
            flash[:errors] = ["can't be blank"]
            redirect_to :back
        end
    end

    def show
        @user = User.find(params[:id])
        @secrets = Secret.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.email = params['Email']
        @user.name = params['Name']
        if @user.valid?
            @user.save
            redirect_to "/users/#{@user.id}"
        else
            flash[:errors] = ['Email is invalid']
            redirect_to :back
        end
    end

    def delete
        @user = User.find(params[:id])
        @user.destroy
        reset_session
        redirect_to '/users/new'
    end


    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private
    def check_user
        if current_user != User.find(params[:id])
            redirect_to "/users/#{session[:user_id]}"
        end
    end
end
