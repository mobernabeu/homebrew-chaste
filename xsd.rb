require "formula"

# This formula downloads a tarball from XSD's homepage and copies the relevant files to the Homebrew set of directories

class Xsd < Formula
  homepage "http://www.codesynthesis.com"
  url "http://www.codesynthesis.com/download/xsd/3.3/macosx/i686/xsd-3.3.0-i686-macosx.tar.bz2"
  sha1 "d5d98d219489239e7007e88365ca3d3ecec95aad"

  def install
    # Copy XSD binary provided by the tarball into /usr/local/bin/xsd
    (bin).install "bin/xsd"
    # Copy files in libxsd/xsd folder of tarball into /usr/local/include/xsd
    (include).install "libxsd/xsd"
  end

end
