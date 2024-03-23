class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: Profile.find_by(user_id: current_user.id),  methods: [:user_ethnicities, :user_genders]
  end

  def create
    image_url = params[:image_file]
    resume_url = params[:resume_file]
    image_errors = false
    resume_errors = false

    # HEADSHOT UPLOAD
    if params[:image_upload] && params[:image_upload] != "null"
      begin
        response = Cloudinary::Uploader.upload(params[:image_upload], resource_type: :auto)
        image_url = response["secure_url"]
      rescue => e
        image_url = null
        image_errors = true
      end
    end

    # RESUME UPLOAD
    if params[:resume_upload] && params[:resume_upload] != "null"
      begin
        response = Cloudinary::Uploader.upload(params[:resume_upload], resource_type: :auto)
        resume_url = response["url"]
      rescue => e
        resume_url = null
        resume_errors = true
      end
    end

    # CREATE PROFILE
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
      other_gender: params[:other_genders],
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
      # Process TECH TALENTS
      if(params[:tech_talents] || params[:other_tech_talents])
        process_tech_talents(params[:tech_talents], params[:other_tech_talents])
      end

      # Process GENDERS & ETHNICITIES
      results = handle_genders_ethnicities(params[:checked_ethnicities], params[:checked_genders], profile)

      if results.length > 0 || resume_errors || image_errors
        render json: {profile: profile, message: 'profile saved successfully', errors: results, image_errors: image_errors, resume_errors: resume_errors}, status: 422
      else
        render json: profile
      end
    else
      render json: {errors: profile.errors.full_messages}, status: 422
    end
    
  end

  def update 

    image_url = params[:image_file]
    resume_url = params[:resume_url]
    image_errors = false
    resume_errors = false

    if params[:image_upload] && params[:image_upload] != "null"
      begin
        response = Cloudinary::Uploader.upload(params[:image_upload], resource_type: :auto)
        image_url = response["secure_url"]
      rescue => e
        image_url = null
        image_errors = true
      end
    end

    if params[:resume_upload] && params[:resume_upload] != "null"
      begin
        response = Cloudinary::Uploader.upload(params[:resume_upload], resource_type: :auto)
        resume_url = response["url"]
      rescue => e
        resume_url = null
        resume_errors = true
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
      other_gender: params[:other_genders],
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
      if params[:tech_talents] || params[:other_tech_talents]
        process_tech_talents(params[:tech_talents], params[:other_tech_talents])
      end

      results = handle_genders_ethnicities(params[:checked_ethnicities], params[:checked_genders], profile)

      if results.length > 0 || resume_errors || image_errors
        render json: {profile: profile, message: 'profile saved successfully', errors: results, image_errors: image_errors, resume_errors: resume_errors}, status: 422
      else
        render json: profile
      end
    else
      render json: {errors: profile.errors.full_messages}, status: 422
    end
  end

  def profile_elements
    genders = Gender.all
    ethnicities = Ethnicity.all
    render json: {genders: genders, ethnicities: ethnicities}
  end
  
  def process_tech_talents()
    current_user.user_tech_talents.destroy_all

    params[:tech_talents].each do |talent|
      if talent
        talent = UserTechTalent.create(
          user_id: current_user.id,
          talent_id: talent
        )
      end
    end
  
    params[:other_tech_talents].each do |key, value|
      category = Talent.find_by(category: key, name: "Other")
      value.each do |val|
        talent = UserTechTalent.create(
          user_id: current_user.id,
          talent_id: category.id,
          other: val
        )
      end
    end
  end

  private 
  
  def handle_genders_ethnicities(checked_ethnicities, checked_genders, profile)
    current_user.user_ethnicities.destroy_all
    current_user.user_genders.destroy_all

    genders = JSON.parse(checked_genders)
    ethnicities = JSON.parse(checked_ethnicities)

    errors = []

    if genders
      genders.each do |gender_id|
        gender = UserGender.create(gender_id: gender_id, user_id: current_user.id, profile_id: profile.id)
        if !gender.valid?
          errors << 'genders'
        end 
      end
    end

    if ethnicities
      ethnicities.each do |ethnicity_id|
        ethnicity = UserEthnicity.create(ethnicity_id: ethnicity_id, user_id: current_user.id, profile_id: profile.id)
        if !ethnicity.valid?
          errors << 'ethnicities'
        end 
      end
    end

    return errors
  end

end
