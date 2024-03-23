class ChargebeeController < ApplicationController

    def show_subscription
    
        render :json => subscription_plan
    end

    def update_subscription
    
        render :json => subscription_plan
    end

    def end_subscription

        render :json => {message: "success"}
    end
end
