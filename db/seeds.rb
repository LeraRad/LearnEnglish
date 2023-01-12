20.times do |word|
  Word.create!(
    eng_word: "Word #{word}",
    translation: "Translation",
    transcription: "Transcription"
    )
end

puts "20 words created"