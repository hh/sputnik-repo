#require 'yaml'
rolename = File.basename(__FILE__).sub(/\.rb/,'')

name rolename
description "#{rolename} for :ii"

run_list(
  "recipe[ii::desktop]"
  )

default_attributes(
  'ii' => {
    'desktop' => {
      'org.gnome.libgnomekbd.keyboard' => {
        'layouts' =>  "\"['us\\tdvorak','us']\"", # I'm a dvorak user
        'options' => "\"['ctrl\\tctrl:nocaps']\"" # CAPSLOCK is evil
      },
      'org.gnome.settings-daemon.peripherals.touchpad' => {
        'scroll-method' => 'two-finger-scrolling',
        'horiz-scroll-enabled' => 'true'
      },
      'org.gnome.desktop.background' => {
        'picture-uri' => 'file:///usr/share/backgrounds/Morning_Dew_by_Lars_Clausen.jpg'
      },
      'org.gnome.desktop.screensaver' => { # for most demos I don't want ANY prompts
        'lock-enabled' => 'false',
        'ubuntu-lock-on-suspend' => 'false'
      }
    }
  }
  )

override_attributes(
)
