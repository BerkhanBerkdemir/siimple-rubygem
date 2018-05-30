##
# Auto updater for siimple CSS framework the Ruby Gems.
#
# Under the MIT LICENSE.
# Maintainer: Berkhan Berkdemir
# License:    https://github.com/BerkhanBerkdemir/siimple-rubygems/blob/master/LICENSE
# Repository: https://github.com/BerkhanBerkdemir/siimple-rubygems.git
# Website:    https://siimple.xyz

class Updater
  # TODO: Specify the branch and caching path
  def initialize
    require 'siimple/version'

    @repository = 'siimple'
    @save_to = { scss: 'assets/stylesheets' }
    @pwd = Dir.pwd
    @version = Siimple::VERSION
  end

  def update
    # Delete old assets
    puts "== Old assets are deleting =="
    system "rm -rf #{@save_to[:scss]}"

    # Assign a variable for siimple repository URL
    repository_url = github 'siimple'
    # Clone siimple
    clone repository_url

    # Checkout the version of siimple
    system "cd siimple; git checkout tags/v#{@version}"

    # Assign a variable for siimple-color repository URL
    siimple_colors_repository_url = github 'siimple-colors'
    # Clone siimple-colors
    clone siimple_colors_repository_url

    # Move siimple-colors into siimple folder
    system 'mv siimple-colors siimple/scss/'

    # Save the folder
    puts '== New SCSS files are moving to new one =='
    system "mv siimple/scss #{@save_to[:scss]}"
    puts '== New assets read to go =='
  end

  def clean
    puts '== The directory is cleaning =='
    system "rm -rf #{@pwd}/siimple"
    puts '== The directory is clean =='
  end

  private

  ##
  # Creates GitHub URLs with owner and repository name
  #
  # String: +repository+
  # String: +owner+
  #   default: 'siimple'
  #
  # Return String of the URL

  def github(repository, owner = 'siimple')
    "https://github.com/#{owner}/#{repository}.git"
  end

  ##
  # Clone a git project
  #
  # String: +url+
  # Integer: +depth+
  #   default: 5

  def clone(url, depth = 5)
    system "git clone --depth=#{depth} #{url}"
  end
end
