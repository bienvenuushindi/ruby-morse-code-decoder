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
    'l' => '.-..',
    'p' => '.--.',
    'r' => '.-.',
    's' => '...',
    'u' => '..-',
    'v' => '...-',
    'w' => '.--',
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
  ]
]

def decode_char(char_set)
  first_char = char_set.split('')[0]
  $morse_code[first_char].each { |key, value|
    if char_set === value
      return key
    end
  }
end

