class TheatersController < ApplicationController

  def index
    theaters = Theater.all
    render json: theaters
  end

  def show
    theater = Theater.find(params[:id])
    render json: theater
  end

  def update
    theater = Theater.find(params[:id])
    theater.update(
      name: params["name"] || theater.name,
      website: params["website"] || theater.website,
      contact_name: params["contact_name"] || theater.contact_name,
      contact_email: params["contact_email"] || theater.contact_email,
      casting_director: params["casting_director"] || theater.casting_director,
      casting_email: params["casting_email"] || theater.casting_email,
      notes: params["notes"] || theater.notes,
      season_type: params["season_type"] || theater.season_type,
      union_status: params["union_status"] || theater.union_status,
      image_url: params["image_url"] || theater.image_url,
      mission: params["mission"] || theater.mission,
      phone: params["phone"] || theater.phone,
      venue: params["venue"] || theater.venue,
      childrens: params["childrens"] || theater.childrens,
      contact_form: params["contact_form"] || theater.contact_form,
      typical_rehearsal_time: params["typical_rehearsal_time"] || theater.typical_rehearsal_time,
      typical_audition_time: params["typical_audition_time"] || theater.typical_audition_time,
      music_director: params["music_director"] || theater.music_director,
      choreographer: params["choreographer"] || theater.choreographer
    )

    if theater.valid?
      render json: theater
    else
      render json: {errors: theater.errors.full_messages}, status: 422
    end
  end
end
