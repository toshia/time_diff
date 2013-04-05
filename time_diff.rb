# -*- coding: utf-8 -*-

Plugin.create(:time_diff) do
  command(:time_diff,
          name: '時間の差をコピー',
          condition: ->(opt){
            case opt.messages.size
            when 1
                opt.messages.first[:replyto]
            when 2
                true end },
          visible: true,
          role: :timeline) do |opt|
    message_a = opt.messages.first
    case opt.messages.size
    when 1
        message_b = opt.messages.first[:replyto]
    when 2
        message_b = opt.messages.last end
    Gtk::Clipboard.copy((message_a[:created] - message_b[:created]).to_i.abs.to_s)
  end
end

