# frozen_string_literal: true

# Validates credit card number using Luhn Algorithm
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    # Sum up the number from right index to left index
    sum = 0
    nums_a.reverse.each_with_index do |digit, index|
      # Double every second digit
      digit *= 2 if index.odd?
      # If doubling results in a two-digit number, subtract 9
      digit -= 9 if digit > 9
      # Add the digit to the sum
      sum += digit
    end

    # Last confimation to check whether the sum % 10 == 0
    (sum % 10).zero?
  end
end
