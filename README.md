Homey
================

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.

Problems? Issues?
-----------

Need help? Ask on Stack Overflow with the tag 'railsapps.'

Your application contains diagnostics in the README file. Please provide a copy of the README file when reporting any issues.

If the application doesn't work as expected, please [report an issue](https://github.com/RailsApps/rails_apps_composer/issues)
and include the diagnostics.

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.1
- Rails 4.2.1

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

On Mac:

```brew install gs``` so that the watermark will not fail for lacking fonts.

Since we need to use very specific fonts for the watermark, we will need to install them manually. I put the three fonts in public: usuziv2.ttf, usuzv2i.ttf, and Watford-Regular DB.ttf. You will need to follow these steps to make them available to imagemagick:

1. Install them on your Mac by double-clicking each file and choosing "Install". The Watford font will give you a warning that I ignored.
2. Make a new directory for ImageMagick local settings and cd into it
  ```
  mkdir ~/.magick
  cd ~/.magick
  ```
3. Grab script to find all fonts on system and store them in a config file
  ```curl http://www.imagemagick.org/Usage/scripts/imagick_type_gen > type_gen```
4. Run script, telling it where my fonts are and create "type.xml" file with list  
  ```find /System/Library/Fonts /Library/Fonts ~/Library/Fonts -name "*.[to]tf" | perl type_gen -f - > type.xml```
5. Go to ImageMagick config folder - note that it differs with each release...
  ```cd /usr/local/Cellar/imagemagick/6.9.0-3/etc/ImageMagick-6```
6. Edit system config file called "type.xml" and add line near end to tell IM to look at local file we made in earlier step
  ```<typemap>
    <include file="type-ghostscript.xml" />
    <include file="/Users/philiphallstrom1/.magick/type.xml" />                       ### THIS LINE ADDED ### 
  </typemap>```


On Ubuntu:

1. Go to public directory of deploy
2. sudo cp *.ttf /usr/local/share/fonts

That simple!

Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
