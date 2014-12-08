require "formula"

class Chaste < Formula
  homepage "http://www.cs.ox.ac.uk/chaste"
  head 'https://github.com/chaste/chaste.git'
  
  depends_on "chaste-dependencies"

  def install
    system "scons"
  end

end
