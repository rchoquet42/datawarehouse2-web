class TeachingMaterialsController < ApplicationController
  helper_method :access_teaching?
  helper_method :reject_teaching?
  helper_method :teaching_requested?

  def index
    #voir config/developement.rb pour la var rails.config
    @slides = Dir.entries("#{Rails.configuration.teaching_material_location}/lecture_slides/").reject! {|n| n[0] == '.'}.sort_by! { |file| naturalized(file) }
    @figpdf = Dir.entries("#{Rails.configuration.teaching_material_location}/figures_pdf/").reject! {|n| n[0] == '.'}.sort_by! { |file| naturalized(file) }
    @figEpdf = Dir.entries("#{Rails.configuration.teaching_material_location}/figures_encapsulated/").reject! {|n| n[0] == '.'}.sort_by! { |file| naturalized(file) }
    @figpng = Dir.entries("#{Rails.configuration.teaching_material_location}/figures_png/").reject! {|n| n[0] == '.'}.sort_by! { |file| naturalized(file) }
    @answers = Dir.entries("#{Rails.configuration.teaching_material_location}/answers_exercises/").reject! {|n| n[0] == '.'}.sort_by! { |file| naturalized(file) }
    @samples = Dir.entries("#{Rails.configuration.teaching_material_location}/sample_databases/").reject! {|n| n[0] == '.'}.sort_by! { |file| naturalized(file) }

  end


  def access_teaching?
    unless current_user.nil?
      teachingrequest = TeachingRequest.find_by user_id: current_user.id
      unless teachingrequest.nil?
        return teachingrequest.validated?
      end
      if admin_user?
        return true
      end
      false
    end
  end

  def reject_teaching?
    teachingrequest = TeachingRequest.find_by user_id: current_user.id
    if !teachingrequest.nil? and teachingrequest.validated? == false and teachingrequest.waiting? == false
      return true
    end
    false
  end

  def teaching_requested?
    teachingrequest = TeachingRequest.find_by user_id: current_user.id
    unless teachingrequest.nil?
      return teachingrequest.waiting?
    end
    false
  end


  private
  #POur trier les fichiers des teaching materials
  def naturalized(file)
    file.scan(/[^\d\.]+|[\d\.]+/).collect { |f| f.match(/\d+(\.\d+)?/) ? f.to_f : f }
  end



end
