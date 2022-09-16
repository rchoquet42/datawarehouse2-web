class ChaptersController < ApplicationController
  # include Zipfilegenerator #module dans directory concern
  before_action :authenticate_user!, :access_teaching!


  def get
    send_file "#{Rails.configuration.teaching_material_location }/#{params[:type]}/#{params[:name]}.#{params[:extension]}", :disposition => 'attachment'
  end

  def index

  end

  def download


    directory_to_zip = "#{Rails.configuration.teaching_material_location }#{params[:type]}"
    output_file = "#{Rails.configuration.teaching_material_location}/tmp/#{params[:type]}.zip"

    File.delete(output_file) if File.exist?(output_file)
    zf = ZipFileGenerator.new(directory_to_zip, output_file)
    zf.write
    send_file "#{output_file}",:type => 'application/zip',
                                      :disposition => 'attachment',
                                      :filename => "#{params[:type]}.zip"
    #sleep 5

  end
end

require 'zip'

# This is a simple example which uses rubyzip to
# recursively generate a zip file from the contents of
# a specified directory. The directory itself is not
# included in the archive, rather just its contents.
#
# Usage:
#   directory_to_zip = "/tmp/input"
#   output_file = "/tmp/out.zip"
#   zf = ZipFileGenerator.new(directory_to_zip, output_file)
#   zf.write()
class ZipFileGenerator
  # Initialize with the directory to zip and the location of the output archive.
  def initialize(input_dir, output_file)
    @input_dir = input_dir
    @output_file = output_file
  end

  # Zip the input directory.
  def write
    entries = Dir.entries(@input_dir) - %w[. ..]

    ::Zip::File.open(@output_file, ::Zip::File::CREATE) do |zipfile|
      write_entries entries, '', zipfile
    end
  end

  private

  # A helper method to make the recursion work.
  def write_entries(entries, path, zipfile)
    entries.each do |e|
      zipfile_path = path == '' ? e : File.join(path, e)
      disk_file_path = File.join(@input_dir, zipfile_path)

      if File.directory? disk_file_path
        recursively_deflate_directory(disk_file_path, zipfile, zipfile_path)
      else
        put_into_archive(disk_file_path, zipfile, zipfile_path)
      end
    end
  end

  def recursively_deflate_directory(disk_file_path, zipfile, zipfile_path)
    zipfile.mkdir zipfile_path
    subdir = Dir.entries(disk_file_path) - %w[. ..]
    write_entries subdir, zipfile_path, zipfile
  end

  def put_into_archive(disk_file_path, zipfile, zipfile_path)
    zipfile.add(zipfile_path, disk_file_path)
  end
end