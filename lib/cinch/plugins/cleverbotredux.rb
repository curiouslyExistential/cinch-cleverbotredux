require 'cinch'
require 'cleverbot'
require 'set'

class CleverBotRedux
  include Cinch::Plugin

  match lambda { |m| /^#{m.bot.nick}: (.+)/i }, use_prefix: false
  match "disablechatter", use_prefix: true, method: :disableChanChat
  match "enablechatter", use_prefix: true, method: :enableChanChat
  match "globaldisable", use_prefix: true, method: :globalDisable
  match "globalenable", use_prefix: true, method: :globalEnable
  match "chatterhelp", use_prefix: true, method: :chatterHelp

  def initialize(*args)
    super
    @admins = ["cExistential"]
    @enabled = true
    @prefixUse = true
    @disabledChannels = Set.new
    @cleverbot = Cleverbot::Client.new
  end

  def execute(m, message)
    return unless @enabled
    if @disabledChannels.include?(m.channel)
      return
    else
      if m.channel
        msg_back = @cleverbot.write message
        m.reply(msg_back, @prefixUse)
      end
	end
  end

  def chatterHelp(m)
    m.reply("Available commands for privileged users (voice and up): ~disablechatter, ~enablechatter", @prefixUse)
  end

  def disableChanChat(m)
    if m.channel.opped?(m.user) or m.channel.half_opped?(m.user) or m.channel.voiced?(m.user)
      if @disabledChannels.add?(m.channel) == nil
        m.reply("CleverBot already disabled.", @prefixUse)
	    return
      else
        m.reply("CleverBot disabled.", @prefixUse)
	    @disabledChannels + ["#{m.channel}"]
        return
      end
    end
  end

  def enableChanChat(m)
    if m.channel.opped?(m.user) or m.channel.half_opped?(m.user) or m.channel.voiced?(m.user)
      if @disabledChannels.delete?(m.channel) == nil
	    m.reply("CleverBot already enabled.", @prefixUse)
	    return
      else
        m.reply("CleverBot enabled.", @prefixUse)
	    @disabledChannels - ["#{m.channel}"]
        return
      end
    end
  end

  def globalDisable(m)
    return unless check_user(m.user)
    if @enabled == true
      @enabled = false
      m.reply("CleverBot is now globally disabled.", @prefixUse)
    else
      m.reply("CleverBot is already globally disabled.", @prefixUse)
    end
  end

  def globalEnable(m)
    return unless check_user(m.user)
    if @enabled == false
      @enabled = true
      m.reply("CleverBot is now globally enabled.", @prefixUse)
    else
      m.reply("CleverBot is already globally enabled.", @prefixUse)
    end
  end

  def check_user(user)
    user.refresh # be sure to refresh the data, or someone could steal
                 # the nick
    @admins.include?(user.authname)
  end
end