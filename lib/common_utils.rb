module CommonUtils

  def generate_unique_code(opts={})
    opts = {col: :code}.merge(opts)
    uid = nil
    loop do
      uid = generate_code(opts)
      break if (opts[:klass] || (self.class == Class ? self : self.class)).where(opts[:col] => uid).count == 0
    end
    uid
  end

  def generate_code(opts={})
    opts = {size: 10, charset: %w{0 1 2 3 4 5 6 7 8 9}}.merge(opts)
    [opts[:prepend], (0...opts[:size]).map{ opts[:charset].to_a[rand(opts[:charset].size)] }.join, opts[:append]].reject{|str| str.blank?}.join(opts[:delimiter] || "-")
  end
end
