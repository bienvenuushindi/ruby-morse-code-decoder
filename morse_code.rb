def list_dot
  { 'a' => '.-', 'e' => '.', 'h' => '....',
    'i' => '..', 'j' => '.---', 'f' => '..-.',
    'l' => '.-..', 'p' => '.--.', 'r' => '.-.',
    's' => '...', 'u' => '..-', 'v' => '...-',
    'w' => '.--', '"' => '.-..-.', '$' => '...-..-',
    '@' => '.--.-.', '_' => '..--.-', '+' => '.-.-.',
    '&' => '.-...', '1' => '.----', '2' => '..---',
    '3' => '...--', '4' => '....-', '5' => '.....',
    '?' => '..--..', '.' => '.-.-.-' }
end

def list_dash
  { 'b' => '-...', 'c' => '-.-.', 'd' => '-..',
    'g' => '--.', 'k' => '-.-', 'm' => '--',
    'n' => '-.', 'o' => '---', 'q' => '--.-', 't' => '-',
    'x' => '-..-', 'y' => '-.--', 'z' => '--..',
    '/' => '-..-.', '(' => '-.--.', ')' => '-.--.-',
    ':' => '---...', ';' => '-.-.-.', '=' => '-...-',
    '-' => '-....-', '6' => '-....', '7' => '--...',
    '8' => '---..', '9' => '----.', '0' => '-----',
    ',' => '--..--', '!' => '-.-.--' }
end

def list_all
  symbol = { 'dash' => '-',
             'dot' => '.' }
  { symbol['dot'].to_s => list_dot,
    symbol['dash'].to_s => list_dash,
    ' ' => ' ' }
end

def decode_char(symbols)
  symbol = symbols.chars[0]
  list_all[symbol]&.each do |key, value|
    return key.capitalize if symbols == value
  end
end

def decode_word(word)
  characters = word.split
  characters.map { |character| decode_char(character) }.join
end

def decode_message(message)
  words = message.split('   ')
  words.map { |word| decode_word(word) }.join(' ')
end

puts decode_message('-- -.--   -. .- -- .')

puts decode_word('.... . .-.. .-.. ---') # HELLO
puts decode_message('.... . -.--   ..- ... .... .. -. -.. .. .-.-.-') # HEY USHINDI.
puts decode_message('..   .- --   - .-. .- -.-. . -.-- .-.-.-') # I AM TRACEY!
puts decode_message('.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ... -.-.--')
