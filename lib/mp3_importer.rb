class MP3Importer

  attr_reader :path

  def initialize(path = "./db/mp3s")
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each {|file_name| Song.new_by_filename(file_name)}
  end


end
