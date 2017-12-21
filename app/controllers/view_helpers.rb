module ViewHelpers

  def render_time(model)
    if Time.now - model < 60
      "#{ (Time.now - model).round} seconds ago."
    elsif Time.now - model < 3600 
      "#{ ((Time.now - model)/60).round} minuets ago."
    elsif Time.now - model < 86400 
      "#{ ((Time.now - model)/60 /60).round} hours ago."
    else 
      "#{ ((Time.now - model)/60 /60 /60).round} days ago."
    end
  end
  
end 