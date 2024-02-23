class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: Profile.find_by(user_id: current_user.id)
  end

  def create
    image_url = params[:image_file]
    resume_url = nil

    if params[:image_upload] && params[:image_upload] != "null"
      response = Cloudinary::Uploader.upload(params["image_upload"], resource_type: :auto)
      image_url = response["secure_url"]
    end

    if params[:resume_upload] && params[:resume_upload] != "null"
      response = Cloudinary::Uploader.upload(params["resume_upload"], resource_type: :auto)
      resume_url = response["secure_url"]
    end

    profile = Profile.create(
      user_id: current_user.id,
      age_low: params[:age_low],
      age_high: params[:age_high],
      union_status: params[:union_status],
      pronouns: params[:pronouns],
      height: params[:height],
      eye_color: params[:eye_color],
      hair_color: params[:hair_color],
      agency: params[:agency],
      manager: params[:manager],
      headshot_url: image_url,
      headline: params[:headline],
      bio: params[:bio],
      other_gender: params[:other_gender],
      other_pronouns: params[:other_pronouns],
      # vocal_range: params[:vocal_range],
      # performance_types: params[:performance_types],
      # professional_website: params[:professional_website],
      resume_url: resume_url,
    )

    if profile.valid?
      render json: profile
    else
      render json: {errors: profile.errors.full_messages}, status: 422
    end
    
  end

  def update 

    image_url = params[:image_file]
    resume_url = nil

    if params[:image_upload] && params[:image_upload] != "null"
      response = Cloudinary::Uploader.upload(params["image_upload"], resource_type: :auto)
      image_url = response["secure_url"]
    end

    if params[:resume_upload] && params[:resume_upload] != "null"
      response = Cloudinary::Uploader.upload(params["resume_upload"], resource_type: :auto)
      resume_url = response["secure_url"]
    end
   
    profile = Profile.find(params[:id])
    profile.update(
      age_low: params[:age_low],
      age_high: params[:age_high],
      union_status: params[:union_status],
      pronouns: params[:pronouns],
      height: params[:height],
      eye_color: params[:eye_color],
      hair_color: params[:hair_color],
      agency: params[:agency],
      manager: params[:manager],
      headshot_url: image_url,
      headline: params[:headline],
      bio: params[:bio],
      other_gender: params[:other_gender],
      other_pronouns: params[:other_pronouns],
      resume_url: resume_url,
    )
    if profile.valid?
      render json: profile
    else
      render json: {errors: profile.errors.full_messages}, status: 422
    end
  end

  def profile_elements
    genders = Gender.all
    ethnicities = Ethnicity.all
    render json: {genders: genders, ethnicities: ethnicities}
  end

end
