homebrew-chaste
==============

Set of Homebrew formulas and related files required to install Chaste
(http://www.cs.ox.ac.uk/chaste) on Mac OS X.

__This repo is currently work in progress and not officially supported by the Chaste project__

There are two main use cases I envision for the Chaste formula:

* Installing the Chaste dependencies and copying the source code to a
 folder defined by the user (e.g. $HOME/workspace). This requires
 providing a host config file consistent with the user's Homebrew
 installation.
* Doing a system install of Chaste, such that third-party applications
  can link against Chaste.

Work to date has focused on the latter.

### Usage

Use the following commands to tap and brew (advisable to `brew update` first):

```
brew tap homebrew/versions
brew tap homebrew/science
brew tap mobernabeu/chaste
brew install --HEAD chaste -v
```

If you make local changes to the formula (i.e. editing `chaste.rb` or
related files), you can brew from your local version with

```
brew install --HEAD chaste.rb -v
```

### Pressing issues:

* At the moment only the `cell_based` component can be compiled and
  installed. This is due to the bleeding edge version of HDF5 not
  being supported by Chaste. There's no older version of HDF5 in the
  `homebrew-versions` tap, but I started working towards a HDF5 1.8.9
  formula in file `hdf5189.rb`.

### Homebrew cook book and example formula:

* https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
* https://github.com/Homebrew/homebrew/blob/master/Library/Contributions/example-formula.rb
