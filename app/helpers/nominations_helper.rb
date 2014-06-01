module NominationsHelper

  def status_check
    if @nomination.complete?
      @html = content_tag :h4, raw("Thank you for your time, this nomination appears to have all of the required documents. You may update the data until <strong>3:00 PM, June 5</strong>"), :class => 'clear positive'
    else
      @html = content_tag :h4, raw("This nomination is incomplete and will not be reviewed until all required materials are included.  Please add all required info by <strong>3:00 PM, June 5</strong>"), :class => 'clear negative'      
    end
  end

end
