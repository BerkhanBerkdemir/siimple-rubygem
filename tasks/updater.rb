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
    puts "+ rm -rf #{@save_to[:scss]}"
    system "rm -rf #{@save_to[:scss]}"

    # Assign a variable for siimple repository URL
    repository_url = github 'siimple'
    # Clone siimple
    clone repository_url

    # Checkout the version of siimple
    puts "+ cd siimple; git checkout tags/v#{@version}"
    system "cd siimple; git checkout tags/v#{@version}"

    # Assign a variable for siimple-color repository URL
    siimple_colors_repository_url = github 'siimple-colors'
    # Clone siimple-colors
    clone siimple_colors_repository_url

    # Move siimple-colors into siimple folder
    puts '+ mv siimple-colors/scss siimple/scss/siimple-colors'
    system 'mv siimple-colors/scss siimple/scss/siimple-colors'

    # Save the folder
    puts "+ mv siimple/scss #{@save_to[:scss]}"
    system "mv siimple/scss #{@save_to[:scss]}"
  end

  def clean
    puts "+ rm -rf #{@pwd}/siimple"
    system "rm -rf #{@pwd}/siimple"

    puts "+ rm -rf #{@pwd}/siimple-colors"
    system "rm -rf #{@pwd}/siimple-colors"
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
    puts "+ git clone --depth=#{depth} #{url}"
    system "git clone --depth=#{depth} #{url}"
  end
end
