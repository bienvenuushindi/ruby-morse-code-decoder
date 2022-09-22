symbol = Hash[
  'dash' => '-',
  'dot' => '.'
]
$morse_code = Hash[
  "#{symbol['dot']}" => Hash[
    'a' => '.-',
    'e' => '.',
    'h' => '....',
    'i' => '..',
    'j' => '.---',
    'f' => '..-.',
    'l' => '.-..',
    'p' => '.--.',
    'r' => '.-.',
    's' => '...',
    'u' => '..-',
    'v' => '...-',
    'w' => '.--',
    '"' => '.-..-.',
    '$' => '...-..-',
    '@' => '.--.-.',
    '_' => '..--.-',
    '+' => '.-.-.',
    '&' => '.-...',
    '1' => '.----',
    '2' => '..---',
    '3' => '...--',
    '4' => '....-',
    '5' => '.....',
    '?' => '..--..',
    '.' => '.-.-.-',
  ],
  "#{symbol['dash']}" => Hash[
    'b' => '-...',
    'c' => '-.-.',
    'd' => '-..',
    'g' => '--.',
    'k' => '-.-',
    'm' => '--',
    'n' => '-.',
    'o' => '---',
    'q' => '--.-',
    't' => '-',
    'x' => '-..-',
    'y' => '-.--',
    'z' => '--..',
    '/' => '-..-.',
    '(' => '-.--.',
    ')' => '-.--.-',
    ':' => '---...',
    ';' => '-.-.-.',
    '=' => '-...-',
    '-' => '-....-',
    '6' => '-....',
    '7' => '--...',
    '8' => '---..',
    '9' => '----.',
    '0' => '-----',
    ',' => '--..--',
    '!' => '-.-.--'
  ],
  ' ' => ' '
]

def decode_char(symbols)
  symbol = symbols.split('')[0]
  if $morse_code[symbol]
    $morse_code[symbol].each { |key, value|
      if symbols === value
        return key.capitalize
      end
    }
  end
end

def decode_word(word)
  characters = word.split(' ')
  characters.map { |character| decode_char(character) }.join
end

def decode_message(message)
  words = message.split('   ')
  words.map { |word| decode_word(word) }.join(' ')
end

puts decode_message("-- -.--   -. .- -- .")

puts decode_word('.... . .-.. .-.. ---') # HELLO

# decode sentence
puts decode_message('.... . -.--   ..- ... .... .. -. -.. .. .-.-.-') # HEY USHINDI.
puts decode_message('..   .- --   - .-. .- -.-. . -.-- .-.-.-') # I AM TRACEY!
puts decode_message('.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ... -.-.--')