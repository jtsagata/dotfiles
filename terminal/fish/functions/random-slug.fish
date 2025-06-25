function random-slug --description "Generate a random two-word slug"
    set words1 adjective agile brave calm clever crazy eager fancy gentle happy cozzy
    set words2 noun bear cat dog fox goat lion panda tiger whale fennec

    set word1 (random choice $words1)
    set word2 (random choice $words2)

    echo "$word1-$word2"
end
