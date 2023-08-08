class ResourcesController < ApplicationController

  def index

    if params[:primary_filter]
      resources = Resource.where(primary_type: params[:primary_filter])
    elsif params[:secondary_filter]
      resources = Resource.where(secondary_type: params[:secondary_filter])
    else
      resources = Resource.all
    end

    resources = resources.order("primary_type ASC", "secondary_type ASC")

    grouped_resources = {}

    resources.each do |resource|
      if grouped_resources[resource.primary_type]
        if grouped_resources[resource.primary_type][resource.secondary_type]
          grouped_resources[resource.primary_type][resource.secondary_type] << resource
        else
          grouped_resources[resource.primary_type][resource.secondary_type] = [resource]
        end
      else
        grouped_resources[resource.primary_type] = {}
      end
    end

    render json: grouped_resources
  end

end