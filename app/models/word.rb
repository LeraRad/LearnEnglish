class Word < ApplicationRecord
  validates_presence_of :eng_word, :transcription, :translation
end
