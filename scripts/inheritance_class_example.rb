class A
  class Aa
  end
end

class B < A
  def run
    Aa.new
  end
end

B.new.run
