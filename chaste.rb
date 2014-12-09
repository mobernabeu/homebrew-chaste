require "formula"

class Chaste < Formula
  homepage "http://www.cs.ox.ac.uk/chaste"
  head 'https://github.com/chaste/chaste.git'
  
  depends_on "xsd"
  depends_on "hdf5" => "enable-parallel"
  depends_on "boost149"
  depends_on "scons"
  depends_on "xerces-c"
  depends_on "petsc"
  depends_on "parmetis" 
  depends_on "metis"
  depends_on "vtk5"
  depends_on "hypre" => :optional

  patch do
    url "https://raw.githubusercontent.com/mobernabeu/homebrew-chaste/master/macosx.diff"
    sha1 "ab7f85ffef42024b89e6329416ffecbd493825b5"
  end

  def install
    system "scons cell_based -j4"
  end

end
