require "formula"

# Homebrew formula documentation:
#   https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#   https://github.com/Homebrew/homebrew/blob/master/Library/Contributions/example-formula.rb

class Chaste < Formula
  homepage "http://www.cs.ox.ac.uk/chaste"
  # We may wanna swap to the internal SVN server and give the option to check out user projects
  head 'https://github.com/chaste/chaste.git'
  
  depends_on "xsd"
  depends_on "hdf5" => "with-mpi"
  depends_on "boost149"
  depends_on "scons"
  depends_on "xerces-c"
  # PETSc build with HYPRE is currently broken (as of Homebrew 5c29c1e350fcc01ff16f6f5ece3764fce3ff8780)
  depends_on "petsc"# => "with-hypre"
  depends_on "parmetis" 
  depends_on "metis"
  depends_on "vtk5"

  patch do
    url "https://raw.githubusercontent.com/mobernabeu/homebrew-chaste/master/macosx.diff"
    sha1 "ab7f85ffef42024b89e6329416ffecbd493825b5"
  end

  def install
    # If you are going to link your application against Chaste, you will need its header files. Copy them
    # before all the build files are generated within the same folders.
    include.install "mesh"

    # The version of HDF5 provided by Homebrew is not fully supported by Chaste, heart won't compile
    system "scons cl=1 co=1 mesh -j4"

    # Copy Chaste libraries over
    lib.install "lib"

  end

end
