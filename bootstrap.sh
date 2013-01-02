#!/bin/bash

if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi

mkdir -p ~/cookbooks; cd ~/cookbooks

cat > soloistrc <<EOF
cookbook_paths:
- $PWD

recipes:
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::1password
- pivotal_workstation::ack
- pivotal_workstation::bartender
- pivotal_workstation::bash4
- pivotal_workstation::bash_completion
- pivotal_workstation::bash_it
- pivotal_workstation::bettertouchtool
- pivotal_workstation::coreutils
- pivotal_workstation::defaults_fast_key_repeat_rate
- pivotal_workstation::disable_front_row
- pivotal_workstation::ec2_api_tools
- pivotal_workstation::enable_assistive_devices
- pivotal_workstation::finder_display_full_path
- pivotal_workstation::findutils
- pivotal_workstation::flycut
- pivotal_workstation::freeruler
- pivotal_workstation::gem_setup
- pivotal_workstation::git
- pivotal_workstation::git_config_global_defaults
- pivotal_workstation::git_scripts
- pivotal_workstation::github_for_mac
- pivotal_workstation::github_ssh_keys
- pivotal_workstation::gitx
- pivotal_workstation::gnu-tar
- pivotal_workstation::grid
- pivotal_workstation::heroku_toolbelt
- pivotal_workstation::homebrew
- pivotal_workstation::hub
- pivotal_workstation::imagemagick
- pivotal_workstation::increase_shared_memory
- pivotal_workstation::istatmenus
- pivotal_workstation::iterm2
- pivotal_workstation::java
- pivotal_workstation::jpegoptim
- pivotal_workstation::memcached
- pivotal_workstation::menubar_preferences
- pivotal_workstation::menumeters
- pivotal_workstation::mongodb
- pivotal_workstation::mysql
- pivotal_workstation::nginx
- pivotal_workstation::node_js
- pivotal_workstation::optipng
- pivotal_workstation::postgres
- pivotal_workstation::postgres_citext
- pivotal_workstation::pwgen
- pivotal_workstation::rbenv
- pivotal_workstation::root_shell_bash
- pivotal_workstation::rvm
- pivotal_workstation::screen_sharing_app
- pivotal_workstation::screen_sharing_on
- pivotal_workstation::sequelpro
- pivotal_workstation::set_finder_show_all_hd_on_desktop
- pivotal_workstation::set_finder_show_user_home_in_sidebar
- pivotal_workstation::shiftit
- pivotal_workstation::siege
- pivotal_workstation::sizeup
- pivotal_workstation::ssl_certificate
- pivotal_workstation::sublime_text
- pivotal_workstation::textmate2
- pivotal_workstation::textmate_bundles
- pivotal_workstation::textmate_plugins
- pivotal_workstation::textmate_preferences
- pivotal_workstation::timemachine_preferences
- pivotal_workstation::unhide_home
- pivotal_workstation::unix_essentials
- pivotal_workstation::user_owns_usr_local
- pivotal_workstation::viscosity
- pivotal_workstation::watch
- pivotal_workstation::wget
- pivotal_workstation::xmlstarlet
- pivotal_workstation::xquartz
- rharter_workstation::sublime_packages
- rharter_workstation::inputrc
EOF

if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
if [[ -d rharter_workstation ]]; then
  cd rharter_workstation && git pull && cd ..
else
  git clone https://github.com/rharter/rharter_workstation.git
fi

soloist
