class Captcha
  def self.random_qa
    x = rand(20)
    y = rand(20)
    z, op = case rand(3)
    when 0 then [x + y, '+']
    when 1 then [x - y, '-']
    when 2 then [x * y, '&times;']
    end
    { question: "#{x} #{op} #{y}", answer: encode(z.to_s)}
  end
  
  def self.encode(input)
    Digest::MD5.hexdigest(input.strip.downcase)
  end
end