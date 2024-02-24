class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: Profile.find_by(user_id: current_user.id)
  end

  def create
    image_url = params[:image_file]
    resume_url = params[:resume_file]

    if params[:image_upload] && params[:image_upload] != "null"
      response = Cloudinary::Uploader.upload(params["image_upload"], resource_type: :auto)
      image_url = response["secure_url"]
    end

    if params[:resume_upload] && params[:resume_upload] != "null"
      response = Cloudinary::Uploader.upload(params["resume_upload"], resource_type: :auto)
      resume_url = response["url"]
    end

    profile = Profile.create(
      acting_reel_url: params[:acting_reel_url],
      age_low: params[:age_low],
      age_high: params[:age_high],
      agency: params[:agency],
      bio: params[:bio],
      eye_color: params[:eye_color],
      hair_color: params[:hair_color],
      headline: params[:headline],
      headshot_url: image_url,
      height: params[:height],
      manager: params[:manager],
      other_ethnicities: params[:other_ethnicities],
      other_gender: params[:other_gender],
      other_pronouns: params[:other_pronouns],
      portfolio_url: params[:portfolio_url],
      professional_website: params[:professional_website],
      pronouns: params[:pronouns],
      resume_url: resume_url,
      tech_agent: params[:tech_agent],
      tech_manager: params[:tech_manager],
      tech_website: params[:tech_website],
      union_status: params[:union_status],
      user_id: current_user.id,
    )

    if profile.valid?
      render json: profile
    else
      render json: {errors: profile.errors.full_messages}, status: 422
    end
    
  end

  def update 

    image_url = params[:image_file]
    resume_url = params[:resume_url]

    if params[:image_upload] && params[:image_upload] != "null"
      begin
        response = Cloudinary::Uploader.upload(params[:image_upload], resource_type: :auto)
        image_url = response["secure_url"]
      rescue => e
        render json: {errors: e}, status: 422
      end
    end

    if params[:resume_upload] && params[:resume_upload] != "null"
      begin
        response = Cloudinary::Uploader.upload(params[:resume_upload], resource_type: :auto)
        resume_url = response["url"]
      rescue => e
        render json: {errors: e}, status: 422
      end
    end

    profile = Profile.find(params[:id])
    profile.update(
      acting_reel_url: params[:acting_reel_url],
      age_low: params[:age_low],
      age_high: params[:age_high],
      agency: params[:agency],
      bio: params[:bio],
      eye_color: params[:eye_color],
      hair_color: params[:hair_color],
      headline: params[:headline],
      headshot_url: image_url,
      height: params[:height],
      manager: params[:manager],
      other_ethnicities: params[:other_ethnicities],
      other_gender: params[:other_gender],
      other_pronouns: params[:other_pronouns],
      portfolio_url: params[:portfolio_url],
      professional_website: params[:professional_website],
      pronouns: params[:pronouns],
      resume_url: resume_url,
      tech_agent: params[:tech_agent],
      tech_manager: params[:tech_manager],
      tech_website: params[:tech_website],
      union_status: params[:union_status],
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
