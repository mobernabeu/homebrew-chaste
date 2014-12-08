require "formula"

class ChasteDependencies < Formula
  homepage "http://www.cs.ox.ac.uk/chaste"
  #head 'https://github.com/chaste/chaste.git'
  
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

#  def install
#    system "scons"
#  end

end
