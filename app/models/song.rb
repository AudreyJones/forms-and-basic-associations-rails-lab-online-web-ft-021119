require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
   end
 
   def genre_name
      self.genre ? self.genre.name : nil
   end

   def artist_name=(name)
    binding.pry
     self.artist = Artist.find_or_create_by(name: name)
   end
 
   def artist_name
    # binding.pry
      self.artist ? self.artist.name : nil
   end

   def note_contents=(content)
    content.each do |content|
     self.notes << Note.find_or_create_by(content: content)
    end
    self.save
    # binding.pry
   end
 
   def note_contents
      if self.notes != nil
      self.notes.map do |note|
        note.content
      end
    end
   end
end
