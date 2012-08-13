#require 'yaml'
rolename = File.basename(__FILE__).sub(/\.rb/,'')

name rolename
description "#{rolename} for :ii"

run_list(
  "recipe[ii-win]",
  "recipe[ii-win::sublime]",
  "recipe[ii-win::background]"
  )

default_attributes(
  'ii' => {
    'background' => 'c:/Windows/Web/Wallpaper/Architecture/img13.jpg',
    'desktop' => {
      'HKEY_CURRENT_USER\Keyboard Layout\Preload' => {
        "1" => "d0010409", # I'm a dvorak user
        "2" => "00000409" # Keep us around in case I plug in my Kinenis
      },
      'HKEY_CURRENT_USER\Keyboard Layout\Substitutes' => {
        "d0010409" => "d0010409" 
      }
    }
  }
  )

override_attributes(
)
