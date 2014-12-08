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

  # Additional downloads can be defined as resources and accessed in the
  # install method. Resources can also be defined inside a stable, devel, or
  # head block. This mechanism replaces ad-hoc "subformula" classes.
  resource "additional_files" do
    url "https://raw.githubusercontent.com/mobernabeu/homebrew-chaste/master/local.py"
    sha1 "aff5488a87801bdd8ea931dce5cd7a6ab520b7af"
  end

  def install
    # Now the sources (from `url`) are downloaded, hash-checked and
    # Homebrew has changed into a temporary directory where the
    # archive has been unpacked or the repository has been cloned.


    # Additional downloads can be defined as resources (see above).
    # The stage method will create a temporary directory and yield
    # to a block.
    resource("additional_files").stage { "python/hostconfig" }

    system "scons"
  end

end
