love:
	if [ -a Gemfile.lock ] ; \
	then \
        rm Gemfile.lock ; \
	fi;
	clear

	gem install bundler
	bundle install

	clear
	#Runner:
	# on the root:
	# 	* Run all:
	# bundle exec cucumber -r features/
	# 	* Run specific scenario:
	# bundle exec cucumber -t @
	# example:
	bundle exec cucumber -r features
