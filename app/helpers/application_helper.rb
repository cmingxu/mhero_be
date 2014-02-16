# -*- encoding : utf-8 -*-
module ApplicationHelper
  def icon_link(what, color="")
    raw "<i class = 'icon-#{what.to_s} icon-#{color}'></i>"
  end

  def control_group_helper(label_name,  description = "", error_message = "", float = "both",  &block)
    error_class = error_message.blank? ? "has-success" : "has-error  has-feedback"
    error_div = content_tag(:span, error_message, :class => "glyphicon glyphicon-remove form-control-feedback")
    label_html = content_tag(:span, label_name, :class => "control-label")
    description_html = content_tag(:p, "（#{description})", :class => "help-block")
    field = content_tag(:div, capture(&block) + error_div)
    content_tag(:div, label_html + field + description_html, :class => "form-group #{error_class}")
  end


  def distance_of_time_in_words_zh(from_time, to_time = 0, include_seconds = false)  
    from_time = from_time.to_time if from_time.respond_to?(:to_time)  
    to_time = to_time.to_time if to_time.respond_to?(:to_time)  
    puts from_time
    puts to_time
    distance_in_minutes = (((to_time - from_time).abs)/60).round  
    distance_in_seconds = ((to_time - from_time).abs).round  

    case distance_in_minutes  
    when 0..1  
      return ' 1 分钟' unless include_seconds  
      case distance_in_seconds  
      when 0..4   then ' 5 秒'  
      when 5..9   then ' 10 秒'  
      when 10..19 then ' 20 秒'  
      when 20..39 then ' 半分钟'  
      else             ' 1 分钟'  
      end  

    when 2..44           then " #{distance_in_minutes} 分钟"  
    when 45..1439        then " #{(distance_in_minutes.to_f / 60.0).round} 小时"  
    when 1440..2879      then ' 昨天'  
    when 2880..4319      then ' 前天'  
    when 4320..43199     then " #{(distance_in_minutes / 1440).round} 天"  
    when 43200..525599   then " #{(distance_in_minutes / 43200).round} 个月"  
    else                      " #{(distance_in_minutes / 525600).round} 年"  
    end  
  end  
end
