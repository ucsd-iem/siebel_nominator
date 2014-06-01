module NominationsHelper

  def status_check
    if @nomination.complete?
      @html = content_tag :h4, raw("Thank you for your time, this nomination appears to have all of the required documents. You may update the data until <strong>#{Settings.deadline.strftime('%l:%M %p on %b %e')}</strong>"), :class => 'clear positive'
    else
      @html = content_tag :h4, raw("This nomination is incomplete and will not be reviewed until all required materials are included.  Please add all required info by <strong>#{Settings.deadline.strftime('%l:%M %p on %b %e')}</strong>"), :class => 'clear negative'      
    end
  end

end
