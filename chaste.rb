require "formula"

# Homebrew formula documentation:
#   https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#   https://github.com/Homebrew/homebrew/blob/master/Library/Contributions/example-formula.rb

class Chaste < Formula
  homepage "http://www.cs.ox.ac.uk/chaste"
  # TODO: we may wanna swap to the internal SVN server and give the option to check out user projects
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
  depends_on "sundials" => ["with-mpi", "env=std"]

  patch do
    url "https://raw.githubusercontent.com/mobernabeu/homebrew-chaste/master/macosx.diff"
    sha1 "faa28dcb345cd20f1086b24ea23122dd668b57e0"
  end

  def install
    # The version of HDF5 provided by Homebrew is not fully supported by Chaste, heart won't compile
    system "scons cl=1 co=1 cell_based -j4"

    # If you are going to link your application against Chaste, you will need its header files.
    # Copy the source code to /usr/local/include/chaste TODO: it would be nicer to cherry pick the 
    # header files only, rather than dumping everything there.
    (include/"chaste").install ["cell_based", "io", "mesh", "pde", "global", "linalg", "ode"]

    # Copy Chaste's lib folder as /usr/local/lib/chaste
    lib.install "lib" => "chaste"

  end

end
