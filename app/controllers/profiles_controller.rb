class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    render json: current_user.profiles.first
  end

  def create
    image_url = params[:image_file]

    if params[:image_upload] && params[:image_upload] != "null"
      response = Cloudinary::Uploader.upload(params["image_upload"], resource_type: :auto)
      image_url = response["secure_url"]
    end

    profile = Profile.create(
      user_id: current_user.id,
      age: params[:age],
      union_status: params[:union_status],
      ethnicity: params[:ethnicity],
      pronouns: params[:pronouns],
      gender: params[:gender],
      height: params[:height],
      eye_color: params[:eye_color],
      hair_color: params[:hair_color],
      agency: params[:agency],
      manager: params[:manager],
      headshot_url: image_url,
      headline: params[:headline],
      bio: params[:bio]
      # vocal_range: params[:vocal_range],
      # performance_types: params[:performance_types],
      # professional_website: params[:professional_website],
      # resume_url: params[:resume_url],
    )

    if profile.valid?
      render json: profile
    else
      render json: {errors: profile.errors.full_messages}, status: 422
    end
    
  end

  def update 

    image_url = params[:image_file]

    if params[:image_upload] && params[:image_upload] != "null"
      response = Cloudinary::Uploader.upload(params["image_upload"], resource_type: :auto)
      image_url = response["secure_url"]
    end
   
    profile = Profile.find(params[:id])
    profile.update(
      age: params[:age],
      union_status: params[:union_status],
      ethnicity: params[:ethnicity],
      pronouns: params[:pronouns],
      gender: params[:gender],
      height: params[:height],
      eye_color: params[:eye_color],
      hair_color: params[:hair_color],
      agency: params[:agency],
      manager: params[:manager],
      headshot_url: image_url,
      headline: params[:headline],
      bio: params[:bio]
    )
    if profile.valid?
      render json: profile
    else
      render json: {errors: profile.errors.full_messages}, status: 422
    end
  end
end
