# Cinch-CleverBotRedux

## Description

A very simple plugin which provides an interface between the Cleverbot webserver, and Cinch. It comes with a number of features, including the option for Channel operators to disable the bot's CleverBot functions for that specific channel.

	<User> CleverBot: how would I even be able to answer that
	<CleverBot> User: By saying dirk strider.
	<User> CleverBot: dirk strider
	<CleverBot> User: Dave Strider loves Dirk Strider.
	<User> CleverBot: Yes. Also, ur a homestuck
	<CleverBot> User: With courage I will face.

## Installation

### RubyGems

You can install the latest Cinch-CleverBot gem using RubyGems

    gem install cinch-cleverbotredux

### GitHub

You can also get the most up to date code directly from Github

    git clone http://github.com/curiouslyExistential/cinch-cleverbotredux.git

## Usage

The following commands are available:

	!disablechatter
	This command, when used by anyone with Voice or higher, will disable the bot's CleverBot interface on that specific channel.

	!enablechatter
	This is used to re-enable the bot's CleverBot interface on said channel. It has the same permissions as the disable command.

	!globaldisable
	This command can only be used by the botmaster (This must be changed in the plugin's coding. I made sure that it's easy to fight, right up top.)
	This command will globally disable the CleverBot interface.

	!globalenable
	This command contains the same permissions as globaldisable. It is used to re-enable the interface. Please note that this will not reset any restriction that a channel operator has imposed on the bot with the previous commands.

Install the gem and load it in your Cinch bot:

    require "cinch"
    require "cinch/plugins/cleverbot"

    bot = Cinch::Bot.new do
      configure do |c|
        # Add all required options here
        c.plugins.plugins = [CleverBotRedux] # Optionally add more plugins
      end
    end

    bot.start

