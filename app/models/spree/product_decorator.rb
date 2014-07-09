module Spree
  Product.class_eval do
    attr_accessor :artist
    # validates :artist, presence: true

    has_many :tracks,
      -> { order("#{::Spree::Track.quoted_table_name}.position ASC") },
      class_name: 'Spree::Track'

    def zip_audio
      styles = self.tracks.first.audio.styles.map(&:first) << :original

      styles.each do |style|
        directory = Pathname.new(self.tracks.first.audio.path(style)).dirname.to_s
        zipfile_name = Pathname.new(self.tracks.first.audio.path(style)).dirname.dirname.to_s+"/"+style.to_s+".zip"

        zipfile = Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
          Dir[File.join(directory, '**', '**')].each do |file|
            zipfile.add(Pathname.new(file).basename.to_s, file)
          end
        end

        if self.master.digitals.map(&:attachment_file_name).include? Pathname.new(zipfile_name).basename.to_s
          digital = self.master.digitals.find {|digital| digital["attachment_file_name"] = Pathname.new(zipfile_name).basename.to_s }
          digital.attachment = File.open(zipfile_name)
          digital.save
        else
          digital = Spree::Digital.create attachment: File.open(zipfile_name)
          self.master.digitals << digital
        end

      end
    end
  end
end