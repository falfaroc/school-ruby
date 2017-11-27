def gcd(v1, v2)
  return v2 if v1.zero?
  return v1 if v2.zero?
  return v1 if v1 == v2

  if v1.even? && v2.even?
    gcd(v1 >> 1, v2 >> 1) << 1
  elsif v1.even?
    gcd(v1 >> 1, v2)
  elsif v2.even?
    gcd(v1, v2 >> 1)
  elsif v1 > v2
    gcd((v1 - v2) >> 1, v2)
  else
    gcd(v1, (v2 - v1) >> 1)
  end
end

puts gcd(11455, 18486)